#!/bin/bash
rm -rf data/PongNoFrameskip-v4_dq
python run_record_train_dqn_atari.py PongNoFrameskip-v4_dq --double_q --gpu 0