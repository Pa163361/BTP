function plot_signal(t,ns,ew,ud,file_name)
    datee = strcat(file_name,': N-S graph vs Time');
    figure();
    subplot(3,1,1);
    plot(t,ns);
    title(datee, 'Interpreter', 'none');
    xlabel('Time');
    ylabel('N-S');
    ylim([-20000 20000]);
    
    subplot(3,1,2);
    plot(t,ew);
    title('E-W graph vs Time');
    xlabel('Time');
    ylabel('E-W');
    ylim([-20000 20000]);
    
    subplot(3,1,3);
    plot(t,ud);
    title('U-D graph vs Time');
    xlabel('Time');
    ylabel('U-D');
    ylim([-20000 20000]);
end