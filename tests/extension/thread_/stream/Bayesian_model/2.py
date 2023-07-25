import random

# 定义目标函数（示例）
def objective_function(x):
    # 多个目标函数，根据实际问题定义
    obj1 = x[0] ** 2
    obj2 = (x[1] - 2) ** 2
    return obj1, obj2

# 定义适应度函数（示例）
def fitness(x):
    obj1, obj2 = objective_function(x)
    # 将多个目标函数转化为适应度值，根据实际问题定义
    return obj1 + obj2

# 定义遗传算法
def genetic_algorithm(population_size, chromosome_length, num_generations):
    population = initialize_population(population_size, chromosome_length)
    for _ in range(num_generations):
        # 计算适应度值
        fitness_values = [fitness(chromosome) for chromosome in population]

        # 选择父代
        parents = selection(population, fitness_values)

        # 交叉繁殖
        offspring = crossover(parents)

        # 变异
        mutated_offspring = mutation(offspring)

        # 替换当前种群
        population = mutated_offspring

    # 返回最优解
    best_chromosomes = get_best_chromosomes(population)
    return best_chromosomes

# 初始化种群
def initialize_population(population_size, chromosome_length):
    population = []
    for _ in range(population_size):
        chromosome = [random.randint(0, 9) for _ in range(chromosome_length)]

        population.append(chromosome)
    return population

# 选择父代
def selection(population, fitness_values):
    # 这里使用锦标赛选择算法，也可以尝试其他选择算法
    tournament_size = 2
    selected_parents = []
    while len(selected_parents) < len(population):
        tournament = random.sample(range(len(population)), tournament_size)
        tournament_fitness = [fitness_values[i] for i in tournament]
        winner_index = tournament[tournament_fitness.index(min(tournament_fitness))]
        selected_parents.append(population[winner_index])
    return selected_parents

# 交叉繁殖
def crossover(parents):
    # 这里使用单点交叉算法，也可以尝试其他交叉算法
    offspring = []
    for i in range(0, len(parents), 2):
        parent1 = parents[i]
        parent2 = parents[i + 1]
        crossover_point = random.randint(1, len(parent1) - 1)
        child1 = parent1[:crossover_point] + parent2[crossover_point:]
        child2 = parent2[:crossover_point] + parent1[crossover_point:]
        offspring.append(child1)
        offspring.append(child2)
    return offspring

# 变异
def mutation(offspring):
    # 这里使用单点变异算法，也可以尝试其他变异算法
    mutation_rate = 0.1
    mutated_offspring = []
    for chromosome in offspring:
        mutated_chromosome = chromosome.copy()
        for i in range(len(mutated_chromosome)):
            if random.random() < mutation_rate:
                mutated_chromosome[i] = random.randint(0, 9)
        mutated_offspring.append(mutated_chromosome)
    return mutated_offspring

# 获取最优解
def get_best_chromosomes(population):
    fitness_values = [fitness(chromosome) for chromosome in population]
    min_fitness = min(fitness_values)
    best_chromosomes = [chromosome for chromosome, fitness_value in zip(population, fitness_values) if fitness_value == min_fitness]
    return best_chromosomes

# 设置参数并运行遗传算法
population_size = 10
chromosome_length = 2
num_generations = 50

best_chromosomes = genetic_algorithm(population_size, chromosome_length, num_generations)
print("Best chromosomes:")
for chromosome in best_chromosomes:
    print(chromosome)
print("Best fitness values:")
for chromosome in best_chromosomes:
    print(fitness(chromosome))
