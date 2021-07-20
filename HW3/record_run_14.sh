#!/bin/bash
rm -rf data/PongNoFrameskip-v4_dq_gamma-0_99
python run_record_train_dqn_atari.py PongNoFrameskip-v4_dq_gamma-0_99 --double_q --gamma 0.99 --gpu 1