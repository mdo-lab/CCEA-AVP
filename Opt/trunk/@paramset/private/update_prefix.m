function [algo] = update_prefix(algo)

if isempty(algo.config)
	algo.prefix_prob = [];
	algo.prefix = [];
else
	algo.prefix_prob = strtok(algo.config, '.');
	algo.prefix = strcat(algo.prefix_prob, '-', algo.codename);
end
return
