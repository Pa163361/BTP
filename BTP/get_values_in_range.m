function anss = get_values_in_range(xt,xt_energy,a,b)
    a_t1 = -1; a_t2 = -1; b_t1 = -1; b_t2 = -1;
    for itr = 1:length(xt_energy)
        if(xt_energy(itr) <= a)
            a_t1 = itr;
        end
        if((xt_energy(itr) >= a) && (a_t2 == -1))
            a_t2 = itr;
        end
        if(xt_energy(itr) <= b)
            b_t1 = itr;
        end
        if((xt_energy(itr) >= b) && (b_t2 == -1))
            b_t2 = itr;
            
        end
    end

    t1 = a_t2; t2 = b_t1;
    if((a - xt_energy(a_t1)) < (xt_energy(a_t2) - a))
        t1 = a_t1;
    end
    if((xt_energy(b_t2) - b) < (b - xt_energy(b_t1)))
        t2 = b_t2;
    end

    anss = zeros(1,t2-t1+1);
    ind = t1;
    for itr = 1:length(anss)
        anss(itr) = xt(ind);
        ind = ind + 1;
    end

end