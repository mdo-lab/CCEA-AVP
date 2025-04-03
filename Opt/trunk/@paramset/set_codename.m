function [algo] = set_codename(algo, codename)
algo.codename = codename;
algo = update_prefix(algo);
return
