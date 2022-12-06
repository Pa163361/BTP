function [ns_amax,ew_amax,ud_amax] = find_peak(ns,ew,ud)
    ns_amax = 0;
    ew_amax = 0;
    ud_amax = 0;
    for i = 1:length(ns)
        if(abs(ns(i)) > ns_amax)
            ns_amax = abs(ns(i));
        end
        if(abs(ew(i)) > ew_amax)
            ew_amax = abs(ew(i));
        end
        if(abs(ud(i)) > ud_amax)
            ud_amax = abs(ud(i));
        end
    end
end