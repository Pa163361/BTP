function [f1,f2] = find_freq_range(NS,rms,Fs,N)
    flag = 0;
    f1 = 0;
    f2 = 0;
    for i = 1:length(NS)
        if(flag == 0)
            if(NS(i) <= rms)
                f1 = (i * Fs)/N;
            else
                flag = 1;
            end
        else
            if(NS(i) >= rms)
                f2 = (i * Fs)/N;
            else
                flag = 0;
            end
        end
    end
end