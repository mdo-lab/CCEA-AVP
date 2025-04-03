function [value] = subsref(algo, s)
switch s.type
    case '.'
        if isfield(algo.params_var, s.subs)
            value = algo.params_var.(s.subs);
        elseif isfield(algo.params_fixed, s.subs)
            value = algo.params_fixed.(s.subs);
        else
            if strcmp(s.subs, 'prefix')
                value = algo.prefix;
            elseif strcmp(s.subs, 'codename')
                value = algo.codename;
            else
                error('paramset: No such parameter (%s)', s.subs);
            end
        end
    otherwise
        error('paramset: This type of subreferencing not allowed.');
end
return