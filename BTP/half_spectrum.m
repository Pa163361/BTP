function [NS,EW,UD] = half_spectrum(ns,ew,ud)
    N = length(ns);
    if(mod(N,2) == 1)
        N = N - 1;
    end
    NS = zeros(1,N/2);
    EW = zeros(1,N/2);
    UD = zeros(1,N/2);

    for i = 1:(N/2)
        NS(i) = ns(i);
        EW(i) = ew(i);
        UD(i) = ud(i);
    end
end