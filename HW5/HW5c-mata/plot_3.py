import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import json
import os

"""
Using the plotter:
Call it from the command line, and supply it with logdirs to experiments.
Suppose you ran an experiment with name 'test', and you ran 'test' for 10 
random seeds. The runner code stored it in the directory structure
    data
    L test_EnvName_DateTime
      L  0
        L log.txt
        L params.json
      L  1
        L log.txt
        L params.json
       .
       .
       .
      L  9
        L log.txt
        L params.json
To plot learning curves from the experiment, averaged over all random
seeds, call
    python plot.py data/test_EnvName_DateTime --value AverageReturn
and voila. To see a different statistics, change what you put in for
the keyword --value. You can also enter /multiple/ values, and it will 
make all of them in order.
Suppose you ran two experiments: 'test1' and 'test2'. In 'test2' you tried
a different set of hyperparameters from 'test1', and now you would like 
to compare them -- see their learning curves side-by-side. Just call
    python plot.py data/test1 data/test2
and it will plot them both! They will be given titles in the legend according
to their exp_name parameters. If you want to use custom legend titles, use
the --legend flag and then provide a title for each logdir.
"""

def get_datasets(fpath, condition=None):
    unit = 0
    datasets = []
    for root, dir, files in os.walk(fpath):
        if 'log.txt' in files:
            param_path = open(os.path.join(root,'params.json'))
            params = json.load(param_path)
            exp_name = params['exp_name']
            
            log_path = os.path.join(root,'log.txt')
            experiment_data = pd.read_table(log_path)

            experiment_data.insert(
                len(experiment_data.columns),
                'Unit',
                unit
                )        
            experiment_data.insert(
                len(experiment_data.columns),
                'Condition',
                condition or exp_name
                )

            datasets.append(experiment_data)
            unit += 1
    datasets = pd.concat(datasets, ignore_index=True)
    return datasets

def plot_3(data):
    x = data.Iteration.unique()
    y_mean = data.groupby('Iteration').mean()
    y_std = data.groupby('Iteration').std()
    
    sns.set(style="darkgrid", font_scale=1.5)
    value = 'AverageReturn'
    plt.plot(x, y_mean[value], label=data['Condition'].unique()[0] + '_train');
    plt.fill_between(x, y_mean[value] - y_std[value], y_mean[value] + y_std[value], alpha=0.2);
    value = 'ValAverageReturn'
    plt.plot(x, y_mean[value], label=data['Condition'].unique()[0] + '_test');
    plt.fill_between(x, y_mean[value] - y_std[value], y_mean[value] + y_std[value], alpha=0.2);
    
    plt.xlabel('Iteration')
    plt.ylabel('AverageReturn')
    plt.legend(loc='best')
    plt.show()


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('logdir', type=str)
    parser.add_argument('--save_name', type=str, default='results')
    args = parser.parse_args()
    
    if not os.path.exists('results'):
        os.makedirs('results')
    
    plot_3(get_datasets(args.logdir))
    
    '''
    plt.savefig(
        os.path.join('results', args.save_name + '.png'),
        bbox_inches='tight',
        transparent=True,
        pad_inches=0.1
    )
    '''

if __name__ == "__main__":
    main()