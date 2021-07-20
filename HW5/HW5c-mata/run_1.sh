#!/usr/bin/env bash

rm -rf data/pm-obs_mlp_h-1
python train_policy.py 'pm-obs' --exp_name mlp_h-1 --history 1 -lr 5e-5 -n 200 --num_tasks 4 -e 3 --gpu 1

python plot.py data/pm-obs_mlp_h-1 --value 'AverageReturn' --save_name p1_train
python plot.py data/pm-obs_mlp_h-1 --value 'ValAverageReturn' --save_name p1_test