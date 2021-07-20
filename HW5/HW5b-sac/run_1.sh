#!/usr/bin/env bash
# HalfCheetah env
rm -rf data/sac_HalfCheetah-v2_reinf  data/sac_HalfCheetah-v2_reparam  data/sac_HalfCheetah-v2_reparam_2qf


python train_mujoco.py --env_name HalfCheetah-v2 --exp_name reinf -e 3 --gpu 0
#it's runing
# remember to change video path as reparam before training
python train_mujoco.py --env_name HalfCheetah-v2 --exp_name reparam --reparam -e 3 --gpu 0

python train_mujoco.py --env_name HalfCheetah-v2 --exp_name reparam_2qf --reparam --two_qf -e 3 --gpu 0



python plot.py data/sac_HalfCheetah-v2_reinf data/sac_HalfCheetah-v2_reparam --save_name p1
python plot.py data/sac_HalfCheetah-v2_reparam data/sac_HalfCheetah-v2_reparam_2qf --save_name p2
python plot.py data/sac_HalfCheetah-v2_reinf data/sac_HalfCheetah-v2_reparam data/sac_HalfCheetah-v2_reparam_2qf --save_name HalfCheetahp1p2