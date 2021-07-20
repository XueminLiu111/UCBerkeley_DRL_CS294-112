#!/bin/bash

set -eux
mkdir -p experiments
rm -rf ./experiments/* 
for e in   Reacher-v2 Humanoid-v2 Walker2d-v2 Hopper-v2  Ant-v2  HalfCheetah-v2
do
    python record_main.py $e --algorithm behavioral_cloning  --save_name $e  # section 2
    python record_main.py $e --algorithm dagger --save_name $e   # section 3
    #python record_main.py $e --algorithm behavioral_cloning --save_name $e\_smooth-l1 --loss smooth_l1 # section 4.1, change the loss functoin of policy network
    python record_main.py $e --algorithm behavioral_cloning --save_name $e\_hidden200 --hidden_dims 200 200 200  # section 4.2, change the structure of policy network
done
python report.py

#for test
#set -eux
#mkdir -p experiments
#rm -rf ./experiments/*
#python record_main.py Reacher-v2 --algorithm behavioral_cloning --save_name Reacher-v2
