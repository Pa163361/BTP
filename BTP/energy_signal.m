function [ns_T,ew_T,ud_T] = energy_signal(t,ns,ew,ud,dt)
    ns_energy = cal_cum_energy(ns,dt);
    ew_energy = cal_cum_energy(ew,dt);
    ud_energy = cal_cum_energy(ud,dt);

    plot(t,ns_energy);
    plot(t,ew_energy);
    plot(t,ud_energy);

    ns_main = get_values_in_range(ns,ns_energy,0.05,0.95);
    ew_main = get_values_in_range(ew,ew_energy,0.05,0.95);
    ud_main = get_values_in_range(ud,ud_energy,0.05,0.95);

    ns_T = length(ns_main)/100;
    ew_T = length(ew_main)/100;
    ud_T = length(ud_main)/100;
    
end