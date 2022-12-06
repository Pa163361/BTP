function [NS,EW,UD] = extract_signal(ns,ew,ud,t1,t2)
    len = (t2-t1+1);
    NS = zeros(1,len);
    EW = zeros(1,len);
    UD = zeros(1,len);

    ind = 1;
    for t = t1:t2
        NS(ind) = ns(t);
        EW(ind) = ew(t);
        UD(ind) = ud(t);
        ind = ind + 1;
    end
end