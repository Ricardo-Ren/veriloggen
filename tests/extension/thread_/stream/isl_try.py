import islpy as isl

# domain = isl.UnionSet("{S[i]: 0 <= i <= 20; T[i,j]: 0 <= i,j <= 10}")
# schedule = isl.UnionMap("{S[i]->[t0,t1,t2]: t0 = 0 and t1 = i and t2 = 0; T[i,j]->[t0,t1,t2]: t0=1 and t1=i and t2=j}")
# A_S_Z = isl.Map("{S[i]->Z[a]: a = i and 0 <= a,i <= 20}")
# A_T_Z = isl.Map("{T[i,j]->Z[a]: a = i + j and 0 <= i,j <= 10 and 0 <= a <= 20}")
# A_T_A = isl.Map("{T[i,j]->A[a]: a = i and 0 <= a <= 20 and 0 <= i,j <= 10}")
# A_T_B = isl.Map("{T[i,j]->B[a]: a = j and 0 <= a <= 20 and 0 <= i,j <= 10}")
# writes = isl.UnionMap(A_S_Z).union(A_T_Z)
# reads = isl.UnionMap(A_T_Z).union(A_T_A).union(A_T_B)
# schedule_space = isl.Set("{[t0,t1,t2]:}").get_space()
# precedes = isl.Map.lex_lt(schedule_space)
# print(precedes)

# domain = isl.UnionSet("{S[i,j] : 0 <= i,j < 1024 }")
# original = isl.UnionMap("{S[i,j] -> [i,j]}")
# transformation = isl.UnionMap("{[i,j] -> [floor(i/4), i % 4, floor(j/4), j % 4]}")

# transformed = original.apply_range(transformation)
# print(domain)
# print(original)
# print(transformed)

context = isl.Set("{ : }")
domain = isl.Set("{ S[t,i] : 1 <=t<=5 and 1<=i<=10 }")
schedule = isl.Map("{ S[t,i] -> T[t+1,i+t+10] }")

schedule_domain = schedule.intersect_domain(domain)

build = isl.AstBuild.from_context(context) 
ast = build.node_from_schedule_map(schedule.intersect_domain(domain))
print(ast)