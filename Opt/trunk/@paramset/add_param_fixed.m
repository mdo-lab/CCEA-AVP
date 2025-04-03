function [algo] = add_param_fixed(algo, key, value)
algo.params_fixed.(key) = value;
return