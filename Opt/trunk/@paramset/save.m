function save(algo)
% SAVE(algo) saves algo parameters
%
filename = strcat(algo.prefix, '-algo.mat');
save(filename, 'algo');
return
