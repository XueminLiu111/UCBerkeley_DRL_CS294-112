import numpy as np
from gym import spaces
from gym import Env

class PointEnv2(Env):
    """
    point mass on a 2-D plane
    goals are sampled randomly from a square
    """

    def __init__(self, num_tasks=1):
        self.reset_task()
        self.reset()
        self.observation_space = spaces.Box(low=-np.inf, high=np.inf, shape=(2,))
        self.action_space = spaces.Box(low=-0.1, high=0.1, shape=(2,))

    def reset_task(self, is_evaluation=False, grain_size=None):
        '''
        Problem 2: sample a new task randomly
        '''
        #====================================================================================#
        #                           ----------PROBLEM 2----------
        #====================================================================================#
        # YOUR CODE HERE
        x = np.random.uniform(-10, 10)
        y = np.random.uniform(-10, 10)
        self._goal = np.array([x, y])

    def reset(self):
        self._state = np.array([0, 0], dtype=np.float32)
        return self._get_obs()

    def _get_obs(self):
        return np.copy(self._state)

    def reward_function(self, x, y):
        return - (x ** 2 + y ** 2) ** 0.5

    def step(self, action):
        x, y = self._state
        # compute reward, add penalty for large actions instead of clipping them
        x -= self._goal[0]
        y -= self._goal[1]
        # check if task is complete
        done = abs(x) < .01 and abs(y) < .01
        reward = self.reward_function(x, y)
        # move to next state
        self._state = self._state + action
        ob = self._get_obs()
        return ob, reward, done, dict()

    def viewer_setup(self):
        print('no viewer')
        pass

    def render(self):
        print('current state:', self._state)

    def seed(self, seed):
        np.random.seed = seed


class PointEnv3(Env):
    """
    point mass on a 2-D plane
    goals are sampled randomly from a square
    """

    def __init__(self, num_tasks=1, grain_size=None):
        self.reset_task(grain_size=grain_size)
        self.reset()
        self.observation_space = spaces.Box(low=-np.inf, high=np.inf, shape=(2,))
        self.action_space = spaces.Box(low=-0.1, high=0.1, shape=(2,))
        

    def reset_task(self, is_evaluation=False, grain_size=None):  # grain_size=5,10 in problem 3
        '''
        sample a new task randomly

        Problem 3: make training and evaluation goals disjoint sets
        if `is_evaluation` is true and `show_train` is false, sample from the evaluation set,
        otherwise sample from the training set
        '''
        #====================================================================================#
        #                           ----------PROBLEM 3----------
        #====================================================================================#
        # YOUR CODE HERE
        if (not is_evaluation):
            x0 = np.random.choice(np.arange(-10, 10, grain_size))  #random int from -10 to 9, grain_size is inteval
            y0 = np.random.choice(np.arange(-10 + grain_size * (x0 // grain_size % 2), 10, grain_size * 2))
        else:
            x0 = np.random.choice(np.arange(-10, 10, grain_size))
            y0 = np.random.choice(np.arange(-10 + grain_size * ((x0 // grain_size + 1) % 2), 10, grain_size * 2))
        x = np.random.uniform(x0, x0 + grain_size)  
        y = np.random.uniform(y0, y0 + grain_size)  
        self._goal = np.array([x, y])   # goal is random!

    def reset(self):
        self._state = np.array([0, 0], dtype=np.float32)
        return self._get_obs()

    def _get_obs(self):
        return np.copy(self._state)

    def reward_function(self, x, y):
        return - (x ** 2 + y ** 2) ** 0.5

    def step(self, action):
        x, y = self._state
        # compute reward, add penalty for large actions instead of clipping them
        x -= self._goal[0]
        y -= self._goal[1]
        # check if task is complete
        done = abs(x) < .01 and abs(y) < .01
        reward = self.reward_function(x, y)
        # move to next state
        self._state = self._state + action
        ob = self._get_obs()
        return ob, reward, done, dict()

    def viewer_setup(self):
        print('no viewer')
        pass

    def render(self):
        print('current state:', self._state)

    def seed(self, seed):
        np.random.seed = seed
