function anss = without_ends(xt,cut_sec,Ts)
    N = length(xt);
    thre = cut_sec/Ts;
    anss = zeros(1,N-(2*thre)+1);
    ind = 1;
    for itr = thre+1:(N-thre)
        anss(ind) = xt(itr);
        ind = ind + 1;
    end
end