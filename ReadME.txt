This code runs the CCEA-AVP, developed in Matlab 2009 as described in the following publication: 

"Singh, H. K., & Ray, T. (2010). Divide and conquer in coevolution: A difficult balancing act. In Agent-Based Evolutionary Search (pp. 117-138). Springer Berlin Heidelberg"


The following paths must be added for running the program (which can be done by simply executing startup.m file in main folder):
/Opt/trunk/
/Opt/trunk/mex
/Opt/trunk/ccea-avp
/run

within /Opt/trunc/mex, execute  >>mex ind_sort2.c 
 
Go inside run folder. 

multirun_ccea.m  is the file that can invoke multiple runs of the CCEA-AVP algorithm

Within multirun_ccea.m, set the following parameters before running:
	Main function:
		test_probs   (test problems)
		nruns        (number of runs)
	do_test_runs function:
		max_evals  	(maximum number of evaluations)
		subevolve_gen (subevolve_gen)
		Folder name for experiments
		param.threshold  --> for changing threshold
		param.no_subsystems --> for changing max partitions. 
		Other parameters (crossover, mutation etc.) as required. 
		
Problem definition file (example): 
	schwefel.m --> contains f, g definition
	schewefel.cf --> contains function name, number of variables, objectives, constraints, bounds
		
After setting the parameters, invoke the file using  
>>multirun_ccea

Output files:
<prob_name>-ccea_avp-fxn_evolution.txt  (fxn evals vs objective value)
<prob_name>-ccea_avp-no_sets.txt  (variables in each partition)		

________________________________________________
For non-commercial use only. 
Last updated 2009 
Contact: h.singh@unsw.edu.au



		
	
 



