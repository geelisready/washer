# -*- coding: utf-8 -*-

import csv


def filter_set(ref_set, result_set):
    """
    Filter the set using the reference.
    :param ref_set: the reference set.
    :param result_set: the result set being filtered.
    :return: the filtered set.
    """
    return set([(u, i) for (u, i) in result_set if i in ref_set])


def save_result(topred, filename):
    """
    Save the result into a csv file named `filename`.
    :param topred: the set to predict.
    :param filename: the filename.
    """
    with open(filename, 'w') as f:
        wr = csv.writer(f)
        wr.writerow(['user_id', 'item_id'])
        topred = set(topred) if not isinstance(topred, set) else topred
        for row in set(topred):
            wr.writerow(row)


def ensure_label(df):
    label = df['label'].copy()
    del df['label']
    df['label'] = label
    print 'Ensured label.'
    return df


def extract_label(df, pred_date):
    """
    Extract the label of the next day of `pred_date`.
    :param df: the data frame.
    :param pred_date: the prediction date.
    :return: the user/item pair with label of the selected date.
    """
    tlabel = df[(df['date'] == pred_date)].groupby(['user_id', 'item_id']).max()
    tlabel['label'] = [1 if t == 4 else 0 for t in tlabel['behavior_type']]
    return tlabel[['label']]
