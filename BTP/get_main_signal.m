function [ns_main,ew_main,ud_main] = get_main_signal(ns,ew,ud,dt)
    ns_energy = cal_cum_energy(ns,dt);
    ew_energy = cal_cum_energy(ew,dt);
    ud_energy = cal_cum_energy(ud,dt);
%     disp(ns_energy);
    
    ns_main = get_values_in_range(ns,ns_energy,0.05,0.95);
    ew_main = get_values_in_range(ew,ew_energy,0.05,0.95);
    ud_main = get_values_in_range(ud,ud_energy,0.05,0.95);
%     disp(ns_main);

end