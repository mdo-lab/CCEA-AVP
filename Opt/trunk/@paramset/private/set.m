function algo = set(algo, key, value)
if isfield(algo.params_var, key)
    algo.params_var.(key) = value;
end
return
