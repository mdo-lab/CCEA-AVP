function algo = paramset(codename, config)
% PARAMSET(config) initializes the parameters for the optimization algo
% 

if nargin == 0
	codename = [];
	config = [];
end

algo.codename = codename;
algo.config = config;
algo.prefix_prob = [];
algo.prefix = [];

% placeholder for all params
algo.params_fixed = [];
algo.params_var = [];
algo.params_var_type = [];
algo.params_var_range = [];

% Define class, so new parameters can be added through user params
algo = class(algo, 'paramset');

% File prefix
algo = update_prefix(algo);

return
