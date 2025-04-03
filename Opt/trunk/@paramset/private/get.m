function value = get(algo, key)
if isfield(algo.params_var, key)
    value = algo.params_var.(key);
end
return
