import numpy as np
from scipy.stats import norm

# 定义目标函数
def objective(x):
    f1 = x[0] ** 2
    f2 = (x[1] - 2) ** 2
    return [f1, f2]

# 定义变量范围
bounds = [(0, 5), (0, 5)]

# 初始化种群
population_size = 10
population = np.random.randint(0, 5, size=(population_size, 2))

# 贝叶斯模型类
class GaussianProcessModel:
    def __init__(self):
        self.X = []
        self.y = []
        self.length_scale = 1.0
        self.sigma_f = 1.0
        self.sigma_n = 1e-6

    def update_model(self):
        self.K = self.kernel(self.X, self.X)
        self.K_inv = np.linalg.inv(self.K + self.sigma_n ** 2 * np.eye(len(self.X)))

    def kernel(self, X1, X2):
        sqdist = np.sum(X1 ** 2, axis=1).reshape(-1, 1) + np.sum(X2 ** 2, axis=1) - 2 * np.dot(X1, X2.T)
        return self.sigma_f ** 2 * np.exp(-0.5 / self.length_scale ** 2 * sqdist)

    def sample_posterior(self, X_s):
        K_s = self.kernel(self.X, X_s)
        K_ss = self.kernel(X_s, X_s)
        K_inv = self.K_inv

        mu_s = K_s.T.dot(K_inv).dot(self.y)
        cov_s = K_ss - K_s.T.dot(K_inv).dot(K_s)
        return mu_s, cov_s

    def acquisition_function(self, X_s):
        mu_s, cov_s = self.sample_posterior(X_s)
        sigma_s = np.sqrt(np.diag(cov_s))
        best_value = np.min(self.y, axis=0)
        z = (best_value - mu_s) / sigma_s
        ei = (best_value - mu_s) * norm.cdf(z) + sigma_s * norm.pdf(z)
        return ei

    def optimize_acquisition(self, bounds):
        best_x = None
        best_acquisition = float('-inf')
        sampled_set = set()

        while best_x is None:
            x = np.random.uniform(bounds[0][0], bounds[0][1], size=(1, 2))
            x = np.round(x).astype(int)  # 取整为整数
            acquisition = self.acquisition_function(x)
            if np.all(acquisition > best_acquisition) and tuple(x.flatten()) not in sampled_set:
                best_x = x
                best_acquisition = acquisition
                sampled_set.add(tuple(x.flatten()))

        return best_x

    def fit(self, X, y):
        self.X = X
        self.y = y
        self.update_model()

# 迭代优化
max_iterations = 1000
for iteration in range(max_iterations):
    # 评估适应度
    fitness_values = np.array([objective(x) for x in population])

    # 标准化适应度
    normalized_fitness = (fitness_values - np.min(fitness_values, axis=0)) / (np.max(fitness_values, axis=0) - np.min(fitness_values, axis=0))

    # 更新模型
    model = GaussianProcessModel()
    model.fit(population, normalized_fitness)

    # 生成新解
    new_population = []
    sampled_set = set()

    while len(new_population) < population_size:
        # 使用贝叶斯模型进行采样
        sampled_solution = model.optimize_acquisition(bounds)

        # 检查解是否重复
        if tuple(sampled_solution.flatten()) not in sampled_set:
            new_population.append(sampled_solution)
            sampled_set.add(tuple(sampled_solution.flatten()))

    population = np.concatenate(new_population, axis=0)

# 打印最终结果
final_fitness_values = np.array([objective(x) for x in population])
best_solutions = population
best_fitness = final_fitness_values
print("最佳解：", best_solutions)
print("最佳适应度：", best_fitness)
