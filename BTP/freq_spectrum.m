function [NS,EW,UD] = freq_spectrum(ns,ew,ud,Fs,file_name)

    datee = strcat(file_name,': N-S graph vs Time');
    NS = fft(ns);
    EW = fft(ew);
    UD = fft(ud);
    f = (0:length(NS)-1)*Fs/length(NS);

    figure();
    subplot(3,1,1);
    plot(f,abs(NS))
    ylim([1000 1000000])
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    title(datee, 'Interpreter', 'none');

    f = (0:length(EW)-1)*Fs/length(EW);
    subplot(3,1,2);
    plot(f,abs(EW))
    ylim([1000 1000000])
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    title('E-W graph vs Time');

    f = (0:length(UD)-1)*Fs/length(UD);
    subplot(3,1,3);
    plot(f,abs(UD))
    ylim([1000 1000000])
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    title('U-D graph vs Time');

end