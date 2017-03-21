import net.sf.jsqlparser.JSQLParserException
import net.sf.jsqlparser.parser.CCJSqlParserUtil
import net.sf.jsqlparser.parser.TokenMgrError
import net.sf.jsqlparser.schema.Table
import net.sf.jsqlparser.statement.Statement
import net.sf.jsqlparser.statement.StatementVisitorAdapter
import net.sf.jsqlparser.statement.create.table.CreateTable
import net.sf.jsqlparser.statement.select.FromItemVisitor
import net.sf.jsqlparser.statement.select.LateralSubSelect
import net.sf.jsqlparser.statement.select.PlainSelect
import net.sf.jsqlparser.statement.select.SelectVisitor
import net.sf.jsqlparser.statement.select.SetOperationList
import net.sf.jsqlparser.statement.select.SubJoin
import net.sf.jsqlparser.statement.select.SubSelect
import net.sf.jsqlparser.statement.select.ValuesList
import net.sf.jsqlparser.statement.select.WithItem

@Grab('com.github.jsqlparser:jsqlparser:0.9.3')
class SQLGenerator {

    class TableDep {
        String name
        List<String> dependents
        Statement statement

        @Override
        String toString() {
            return "$name: $dependents ($statement)"
        }
    }

    class TableNameExtractor implements FromItemVisitor, SelectVisitor {

        List<String> tables = new ArrayList<>();

        /*
         Visit SELECT statement.
         */

        @Override
        void visit(PlainSelect plainSelect) {
            plainSelect.fromItem.accept(this)
        }

        @Override
        void visit(SetOperationList setOpList) {
        }

        @Override
        void visit(WithItem withItem) {
        }

        /*
         Visit FROM items.
         */

        @Override
        void visit(Table table) {
            tables.add table.name
        }

        @Override
        void visit(SubSelect subSelect) {
            subSelect.selectBody.accept(this)
        }

        @Override
        void visit(SubJoin subjoin) {
            subjoin.accept(this)
        }

        @Override
        void visit(LateralSubSelect lateralSubSelect) {
        }

        @Override
        void visit(ValuesList valuesList) {
        }
    }

    private PrintStream sqlErrOut
    private PrintStream tokenErrOut
    private PrintStream resultOut
    private ByteArrayOutputStream resultStream
    private PrintStream out

    SQLGenerator(String buildDirectory) {
        File buildDir = new File(buildDirectory)
        if (!buildDir.exists()) {
            buildDir.mkdir()
        }
        sqlErrOut = new PrintStream(new FileOutputStream("$buildDirectory/sql_err.log"))
        tokenErrOut = new PrintStream(new FileOutputStream("$buildDirectory/token_err.log"))
        resultOut = new PrintStream(new FileOutputStream("$buildDirectory/result.sql"))
        out = new PrintStream(resultStream = new ByteArrayOutputStream())
    }

    Map<String, TableDep> tableDepMap = new HashMap<>();

    def processSQLFolder(File f) {
        if (!f.isHidden()) {
            if (f.isDirectory()) {
                f.eachFile { fi ->
                    processSQLFolder(fi)
                }
            } else {
                processSQLFile(f)
            }
        }
        println "[Done][Folder] $f."
    }

    def processSQLFile(File f) {
        // pre-process SQL file.
        def rawSQLText = f.getText('gbk')
        def stripComments = new StringBuilder()
        rawSQLText.toString().split('\n').each { line ->
            def l = line.trim()
            int commentIdx = l.indexOf('--')
            if (commentIdx >= 0) {
                stripComments.append l.substring(0, commentIdx)
            } else {
                stripComments.append l
            }
            stripComments.append '\n'
        }
        List<String> sqls = new ArrayList<>()
        stripComments.toString().split(';').each { line ->
            def l = line.trim()
            if (!l.startsWith('drop') && !l.startsWith('show') && !l.startsWith('help') && !l.startsWith('kill') && !l.startsWith('select') && !l.empty) {
                sqls.add l.replace('==', '=').replaceAll('\\s([0-9]+[a-z_]+)', ' t$1').replace(':', '_colon_')
            }
        }

        // Process the dependent graph.
        for (String sql : sqls) {
            try {
                Statement statement = CCJSqlParserUtil.parse(sql)
                statement.accept(new StatementVisitorAdapter() {
                    @Override
                    void visit(CreateTable createTable) {
                        TableNameExtractor tableExtractor = new TableNameExtractor()
                        createTable.select.selectBody.accept tableExtractor
                        tableDepMap[createTable.table.name] = new TableDep(
                                name: createTable.table.name,
                                dependents: tableExtractor.tables,
                                statement: createTable
                        )
                    }
                })
            } catch (JSQLParserException ex) {
                sqlErrOut.println "Error when parsing ``$f'': $sql. "
                println "[Error][Parser] $f. "
                sqlErrOut.println ex.cause.message
            } catch (TokenMgrError err) {
                tokenErrOut.println "Error when parsing ``$f'': $sql. "
                println "[Error][Tokenizior] $f. "
//                err.printStackTrace(tokenErrOut)
                tokenErrOut.println err.message
            }
        }

        println "[Done][File] $f."
    }

    def generateDependentSQL(String table, Map<String, TableDep> tableDepMap, Set<String> tableNames = new HashSet<>()) {
        if (!tableNames.contains(table)) {
            tableNames.add table
            if (tableDepMap.containsKey(table)) {
                tableDepMap[table].dependents.each { t ->
                    generateDependentSQL(t, tableDepMap, tableNames)
                }
                out.println "${tableDepMap[table].statement};"
            } else if (table != 'mobile_recommend_train_user_filter_item') {
                out.println "-- Table `$table` not found."
            }
        }
    }

    def run(String sourceDirectory) {
        processSQLFolder new File(sourceDirectory)

        Set<String> tableNames = new HashSet<>()
        tableDepMap.each { table, tableDep ->
            generateDependentSQL(table, tableDepMap, tableNames)
        }

        resultOut.println resultStream.toString().replace('_colon_', ':')

        println "Done generating tables."
    }
}

new SQLGenerator('build').run('src')
