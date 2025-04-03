function [algo] = add_param_var(algo, key, value, varargin)
algo.params_var.(key) = value;

type = 'CHAR';
range = [];

if nargin > 4, range = varargin{2}; end
if nargin > 3, type = varargin{1}; end

algo.params_var_type.(key) = type;
algo.params_var_range.(key) = range;
return