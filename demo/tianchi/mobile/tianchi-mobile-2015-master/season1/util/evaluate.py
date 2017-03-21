# -*- coding: utf-8 -*-


def f1(pred, ref):
    """ Evaluate the F1 value of the prediction set and reference set.
    :param pred: the prediction set.
    :param ref:  the reference set.
    :return: the F1 value.
    """
    pred_len = float(len(pred))
    ref_len = float(len(ref))
    intersected_len = len(pred.intersection(ref))
    precision = intersected_len / pred_len
    recall = intersected_len / ref_len
    print "Precision: ", precision
    print "Recall: ", recall
    return 2 * precision * recall / float(precision + recall)
