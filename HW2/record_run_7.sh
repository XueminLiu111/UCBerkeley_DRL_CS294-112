#python load_model.py LunarLanderContinuous-v2 -ep 1000 --discount 0.99 -n 100 -e 3 -l 2 -s 64 -b 40000 -lr 0.005 -rtg --nn_baseline -nt --exp_name ll_b-40000_lr-0.005


# error after a few steps, why?
# solved by replace the lunar_lander.py in gym/envs/box2d

# vedio is already _baseline

rm -rf data/ll_b-40000_lr-0.005_LunarLanderContinuous-v2
python record_train_pg_f18.py LunarLanderContinuous-v2 -ep 1000 --discount 0.99 -n 100 -e 3 -l 2 -s 64 -b 40000 -lr 0.005 -rtg --nn_baseline -nt --exp_name ll_b-40000_lr-0.005
python plot.py data/ll_b-40000_lr-0.005_LunarLanderContinuous-v2 --save_name p7

# not work on CRC becaues image erreo