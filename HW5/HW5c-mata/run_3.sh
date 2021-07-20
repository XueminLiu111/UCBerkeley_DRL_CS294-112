#!/usr/bin/env bash

rm -rf data/pm3_gru_h-60_gs-10 data/pm3_gru_h-60_gs-5 data/pm3_gru_h-60_gs-1
python train_policy.py 'pm3' --exp_name gru_h-60_gs-10 --history 60 --discount 0.90 -lr 5e-4 -n 60 -gs 10 -rec -e 3 --gpu 1
python train_policy.py 'pm3' --exp_name gru_h-60_gs-5 --history 60 --discount 0.90 -lr 5e-4 -n 60 -gs 5 -rec -e 3 --gpu 1
python train_policy.py 'pm3' --exp_name gru_h-60_gs-1 --history 60 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -rec -e 3 --gpu 1


python plot.py data/pm3_gru_h-60_gs-1 data/pm3_gru_h-60_gs-5 data/pm3_gru_h-60_gs-10 --legend gru_h-60_gs-1_train gru_h-60_gs-5_train gru_h-60_gs-10_train --save_name p3_train
python plot.py data/pm3_gru_h-60_gs-1 data/pm3_gru_h-60_gs-5 data/pm3_gru_h-60_gs-10 --value ValAverageReturn --legend gru_h-60_gs-1_test gru_h-60_gs-5_test gru_h-60_gs-10_test --save_name p3_test

python plot_3.py data/pm3_gru_h-60_gs-1 --save_name p3_1
python plot_3.py data/pm3_gru_h-60_gs-5 --save_name p3_5
python plot_3.py data/pm3_gru_h-60_gs-10 --save_name p3_10