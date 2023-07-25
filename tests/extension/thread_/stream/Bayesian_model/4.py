from pymoo.core.problem import ElementwiseProblem
from pymoo.core.variable import Real, Integer, Choice, Binary
from parallel_reduce_multicore import vg_reduce
from get_HWresources import execute_remote_command
import re
size = 512
error_value = 1e5
size = 1024
pattern = r'exec_time = (\d+)'
class MixedVariableProblem(ElementwiseProblem):

    def __init__(self, **kwargs):
        vars = {
            "y": Integer(bounds=(2, 512)),
            "z": Integer(bounds=(2, 512)),
        }
        super().__init__(vars=vars, n_obj=1, **kwargs)

    def _evaluate(self, X, out, *args, **kwargs):
        core_num, par = X["z"], X["y"]
        if core_num*par>size:out["F"] = error_value;return
        
        rslt = vg_reduce(size=1024, core_num=core_num, para=par)
        exe_time = re.search(pattern, rslt)
        if exe_time == None:out["F"] = error_value;return
        total_power, resource = execute_remote_command() 
        f = total_power+resource+exe_time
        out["F"] = f


from pymoo.core.mixed import MixedVariableGA, MixedVariableSampling
from pymoo.optimize import minimize

problem = MixedVariableProblem()

algorithm = MixedVariableGA(pop=100)

res = minimize(problem,
               algorithm,
               termination=('n_evals', 1000),
               seed=1,
               verbose=False)

print("Best solution found: \nX = %s\nF = %s" % (res.X, res.F))