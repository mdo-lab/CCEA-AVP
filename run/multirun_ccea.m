
function multirun_ccea


test_probs = {'schwefel'}; % test problems. Multiple could be defined separated by comma. 
nruns = 1; % Number of runs

do_test_runs(nruns,test_probs);

return
   
function do_test_runs(nruns,test_probs)

max_evals = 100000;             % Set maximum number of function evaluations
subevolve_gen = 20;             % Subevolve generations

mkdir Results                  % Results folder
cd Results
for prob_no = 1:length(test_probs)
    test_prob = test_probs{prob_no};
    dir_name = sprintf('%s-results',test_prob);
    mkdir(dir_name);
    cd(dir_name);
    config = sprintf('%s.cf',test_prob);
    prob = problem(config);
    for i = 1:nruns
        fprintf('Current: run-%d\n',i);
        dir_name1 = sprintf('run%d',i);
        mkdir(dir_name1);
        cd(dir_name1);
        fp = fopen ('params.m','w');
        fprintf(fp,'param.pop_size =100;\n');
        fprintf(fp,'param.generations_K =100;\n');
        fprintf(fp,'param.prob_re =1.0;\n');
        fprintf(fp,'param.prob_mu =0.1;\n');
        fprintf(fp,'param.eta_re =15;\n');
        fprintf(fp,'param.eta_mu =20;\n');
        fprintf(fp,'param.seed =%d;\n', i*1000);
        fprintf(fp,'param.batch_mode =1;\n');
        fprintf(fp,'param.threshold=0.6;\n');                   %--> This is where threshold is defined
        fprintf(fp,'param.no_sub_iterations= %d;\n', subevolve_gen);
        fprintf(fp,'param.max_fn_evals= %d;\n', max_evals);
        fprintf(fp,'param.no_subsystems = 10;\n');              %--> Max subsystems
        fprintf(fp,'param.partition_strategy = 5;\n');
        fprintf(fp,'param.evolve_strat_choice = 1;\n');              
        fclose(fp);
        p = ccea_avp(config);
        cd ..
    end
    cd ..
end
cd ..

return

