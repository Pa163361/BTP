function [NS_b,EW_b,UD_b] = plot_bw(t,ns,ew,ud,lf,hf,Fs,file_name,doPlot)
    datee = strcat(file_name,'Bandlimited Signal',': N-S graph vs Time');
    fpass = [lf hf];
    NS_b = bandpass(ns,fpass,Fs);
    EW_b = bandpass(ew,fpass,Fs);
    UD_b = bandpass(ud,fpass,Fs);

    if(doPlot == 1)
        figure();
        subplot(3,1,1);
        plot(t,NS_b);
        title(datee, 'Interpreter', 'none');
        xlabel('Time');
        ylabel('N-S');
        ylim([-20000 20000]);
        
        subplot(3,1,2);
        plot(t,EW_b);
        title('E-W graph vs Time');
        xlabel('Time');
        ylabel('E-W');
        ylim([-20000 20000]);
        
        subplot(3,1,3);
        plot(t,UD_b);
        title('U-D graph vs Time');
        xlabel('Time');
        ylabel('U-D');
        ylim([-20000 20000]);
    end

end