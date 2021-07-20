#!/bin/bash

#InvertedPendulum
b=1000
lr=1e-2
rm -rf data/ip_b-$b\_lr-$lr\_InvertedPendulum-v2
python record_train_pg_f18.py InvertedPendulum-v2 -ep 1000 --discount 0.9 -n 100 -e 3 -l 2 -s 64 -b $b -lr $lr -rtg -nt --exp_name ip_b-$b\_lr-$lr  
python plot.py data/ip_b-$b\_lr-$lr\_InvertedPendulum-v2 --save_name p5_ip_b-$b\_lr-$lr




# InvertedDoublePendulum
b=10000
lr=1e-2
rm -rf data/ip_b-$b\_lr-$lr\_InvertedDoublePendulum-v2
python record_train_pg_f18.py InvertedDoublePendulum-v2 -ep 1000 --discount 0.9 -n 100 -e 3 -l 2 -s 64 -b $b -lr $lr -rtg -nt --exp_name double_ip_b-$b\_lr-$lr 
python plot.py data/ip_b-$b\_lr-$lr\_InvertedDoublePendulum-v2 --save_name p5_double_ip_b-$b\_lr-$lr



# code work
# but, the vedio is black!!
# only record a corner for mujoco and robotics env from 500,500 to 1280*3,1024*2
# solved by change the window size of 
# /Users/liuxuemin/anaconda3/lib/python3.7/site-packages/gym/envs/mujoco/mujoco_env.py  line94
# /Users/liuxuemin/anaconda3/lib/python3.7/site-packages/gym/envs/robotics/robot_env.py  line94

#python load_model.py InvertedPendulum-v2 -ep 1000 --discount 0.9 -n 100 -e 3 -l 2 -s 64 -b 1000 -lr 1e-2 -rtg -nt --exp_name ip_b-$b\_lr-$lr
#python load_model.py InvertedDoublePendulum-v2 -ep 1000 --discount 0.9 -n 100 -e 3 -l 2 -s 64 -b 1000 -lr 1e-2 -rtg -nt -vd results/InvertedDoublePendulum.mp4 --exp_name ip_b-$b\_lr-$lr
