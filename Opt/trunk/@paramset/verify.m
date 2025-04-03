function verify(algo)

params = fieldnames(algo.params_var);
for i = 1:length(params)
    param = params{i};
    if isempty(algo.params_var.(param))
        error(sprintf('paramset: %s not defined', param));
    end
end

return
