#!/usr/bin/env bash

# gru network
rm -rf data/pm2_gru_h-1  data/pm2_gru_h-20  data/pm2_gru_h-40  data/pm2_gru_h-60 
python train_policy.py 'pm2' --exp_name gru_h-1 --history 1 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -rec -e 3 --gpu 1
python train_policy.py 'pm2' --exp_name gru_h-20 --history 20 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -rec -e 3 --gpu 1
python train_policy.py 'pm2' --exp_name gru_h-40 --history 40 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -rec -e 3 --gpu 1
python train_policy.py 'pm2' --exp_name gru_h-60 --history 60 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -rec -e 3 --gpu 1


#mlp network
rm -rf  data/pm2_mlp_h-1  data/pm2_mlp_h-20  data/pm2_mlp_h-40  data/pm2_mlp_h-60 
python train_policy.py 'pm2' --exp_name mlp_h-1  --history 1 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -e 3 --gpu 1
python train_policy.py 'pm2' --exp_name mlp_h-20  --history 20 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -e 3 --gpu 1
python train_policy.py 'pm2' --exp_name mlp_h-40  --history 40 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -e 3 --gpu 1
python train_policy.py 'pm2' --exp_name mlp_h-60  --history 60 --discount 0.90 -lr 5e-4 -n 60 -gs 1 -e 3 --gpu 1


#plot
python plot.py data/pm2_mlp_h-1   data/pm2_mlp_h-20  data/pm2_mlp_h-40  data/pm2_mlp_h-60 _train --value 'AverageReturn' --save_name p2_mlp_train
python plot.py data/pm2_mlp_h-1   data/pm2_mlp_h-20  data/pm2_mlp_h-40  data/pm2_mlp_h-60  --value 'ValAverageReturn' --save_name p2_mlp_test
python plot.py data/pm2_gru_h-1   data/pm2_gru_h-20  data/pm2_gru_h-40  data/pm2_gru_h-60  --value 'AverageReturn' --save_name p2_gru_train
python plot.py data/pm2_gru_h-1   data/pm_gru_h-20  data/pm2_gru_h-40  data/pm2_gru_h-60  --value 'ValAverageReturn' --save_name p2_gru_test

python plot.py data/pm2_mlp_h-1  data/pm2_gru_h-1  --value 'AverageReturn'  --save_name p2_1_train
python plot.py data/pm2_mlp_h-1  data/pm2_gru_h-1  --value 'ValAverageReturn'  --save_name p2_1_test
python plot.py data/pm2_mlp_h-20  data/pm2_gru_h-20  --value 'AverageReturn' --save_name p2_20_train
python plot.py data/pm2_mlp_h-20  data/pm2_gru_h-20  --value 'ValAverageReturn' --save_name p2_20_test
python plot.py data/pm2_mlp_h-40  data/pm2_gru_h-40  --value 'AverageReturn' --save_name p2_40_train
python plot.py data/pm2_mlp_h-20  data/pm2_gru_h-20  --value 'ValAverageReturn' --save_name p2_40_test
python plot.py data/pm2_mlp_h-60  data/pm2_gru_h-60  --value 'AverageReturn' --save_name p2_60_train
python plot.py data/pm2_mlp_h-20  data/pm2_gru_h-20  --value 'ValAverageReturn' --save_name p2_60_test