#!/bin/bash
rm -rf data/*_InvertedPendulum-v2
python record_train_ac_f18_moreExpressive.py InvertedPendulum-v2 -ep 1000 --discount 0.95 -n 100 -e 3 -lactor 2 -lcritic 4 -sactor 64 -scritic 128 -b 5000 -lractor 0.01 -lrcritic 0.02 --exp_name 10_10 -ntu 10 -ngsptu 20 -nt --gpu 1

rm -rf data/*_HalfCheetah-v2
python record_train_ac_f18_moreExpressive.py HalfCheetah-v2 -ep 150 --discount 0.90 -n 100 -e 3 -lactor 2 -lcritic 4 -s 32 -scritic 64 -b 30000 -lractor 0.02 -lrcritic 0.025  --exp_name 10_10 -ntu 10 -ngsptu 20 -nt --gpu 1

python plot.py data/ac_10_20_InvertedPendulum-v2 data/ac_10_20_HalfCheetah-v2 --legend ac_10_10_InvertedPendulum-v2 ac_10_10_HalfCheetah-v2 --save_name p22