sim = simulation.Simulator(test, sim='verilator')
    rslt = sim.run(outputfile='verilator.out')
    print(rslt)