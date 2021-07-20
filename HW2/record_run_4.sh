#!/bin/bash

rm -rf data/sb_* data/lb_*
# only record sb_rtg_na  and lb_rtg_na  on July 15,2020

# no need to change name and path by hand since July 16,2020
python record_train_pg_f18.py CartPole-v0 -n 100 -b 1000 -e 3 -rtg -nt --exp_name sb_rtg_na  
python record_train_pg_f18.py CartPole-v0 -n 100 -b 1000 -e 3 -dna -nt --exp_name sb_no_rtg_dna
python record_train_pg_f18.py CartPole-v0 -n 100 -b 1000 -e 3 -rtg -dna -nt --exp_name sb_rtg_dna
python record_train_pg_f18.py CartPole-v0 -n 100 -b 1000 -e 3 -rtg -nt --exp_name sb_rtg_na
python record_train_pg_f18.py CartPole-v0 -n 100 -b 5000 -e 3 -dna -nt --exp_name lb_no_rtg_dna
python record_train_pg_f18.py CartPole-v0 -n 100 -b 5000 -e 3 -rtg -nt -dna --exp_name lb_rtg_dna
python record_train_pg_f18.py CartPole-v0 -n 100 -b 5000 -e 3 -rtg -nt --exp_name lb_rtg_na

python plot.py data/sb_no_rtg_dna_CartPole-v0 data/sb_rtg_dna_CartPole-v0 data/sb_rtg_na_CartPole-v0 --save_name p4_sb
python plot.py data/lb_no_rtg_dna_CartPole-v0 data/lb_rtg_dna_CartPole-v0 data/lb_rtg_na_CartPole-v0 --save_name p4_lb




#test load_model.py for inital state
#python load_model.py CartPole-v0 -n 100 -b 1000 -e 3 -rtg -nt -vd results/cartpole.mp4 --exp_name sb_rtg_na  
#python load_model.py MountainCar-v0 -n 100 -b 1000 -e 3 -rtg -nt -vd results/MountainCar.mp4 --exp_name sb_rtg_na  
