#!/bin/bash
set -eux
mkdir -p expert_data
for e in Reacher-v2 
do
    python run_expert.py experts/$e.pkl $e --num_rollouts=20
done
