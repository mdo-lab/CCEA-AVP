function [algo] = subsasgn(algo, s, value)
switch length(s)
    case 1
        if s.type == '.'
            if isfield(algo.params_var, s.subs)
                algo.params_var.(s.subs) = value;
            else
                error('paramset: No such parameters (%s)', s.subs);
            end
        else
            error('paramset: This type of subreferencing not allowed');
        end
    case 2
        if s(1).type == '.' && s(2).type == '.'
            algo.(s(1).subs).(s(2).subs) = value;
        else
            error('paramset: This type of subreferencing not allowed.');
        end
    otherwise
        error('paramset: This type of subreferencing not allowed.');
end
return
