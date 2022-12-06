function cum_energy = cal_cum_energy(xt,dt)
    n = length(xt);
    cum_integral = 0;
    cum_energy = zeros(1,n);
    for itr = 1:n
        cum_integral = cum_integral + (xt(itr) * xt(itr) * dt);
        cum_energy(itr) = cum_integral;
    end

    for itr = 1:n
        cum_energy(itr) = cum_energy(itr)/cum_integral;
    end

end