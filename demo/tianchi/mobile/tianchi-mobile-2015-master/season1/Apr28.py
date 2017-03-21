# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import pandas as pd

from features import useritem


def main():
    u = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered.csv')

    useritem_features = pd.DataFrame(dict(
        last_0_click=useritem.behavior_last_hour(u, '2014-12-17', 1),
        last_0_mark=useritem.behavior_last_hour(u, '2014-12-17', 2),
        last_0_cart=useritem.behavior_last_hour(u, '2014-12-17', 3),
        last_0_buy=useritem.behavior_last_hour(u, '2014-12-17')
    ))