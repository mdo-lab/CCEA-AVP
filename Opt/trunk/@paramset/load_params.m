function [algo] = load_params(algo)

% load user defined parameters from params.m and (prob)_params.m
if ~isempty(algo.prefix)
	clear param;

	param = [];
	try
		t = fileread('params.m');
		eval(t);
	end

	try
    	param_file = strcat(algo.prefix_prob, '_params.m');    
		t = fileread(param_file);
		eval(t);
    end

    if ~isempty(param)
    	fields = fieldnames(param);
    	for i = 1:length(fields)
    		key = fields{i};
    		algo = set(algo, key, param.(key));
        end
    end

	clear param;
end

% Set the random seed
if ~isempty(algo.prefix)
	if isempty(algo.params_var.seed)
		fprintf('No seed given, using computer generated seed\n');
		algo.params_var.seed = round(rand(1)*2^32);
	end

	% initialize random sequence
	rand('state', algo.params_var.seed);
end


% Verify if all the required parameters are defined
if ~isempty(algo.prefix)
	verify(algo);
end
return
