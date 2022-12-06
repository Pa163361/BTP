function [NS_R,EW_R,UD_R] = cal_ratios(NS_1,EW_1,UD_1,NS_2,EW_2,UD_2,Fs)
%     disp('hi');
%     [NS_1,EW_1,UD_1] = freq_spectrum(ns_1,ew_1,ud_1,Fs,file_name);
%     [NS_2,EW_2,UD_2] = freq_spectrum(ns_2,ew_2,ud_2,Fs,file_name);


    NS_R = NS_2./NS_1;
    EW_R = EW_2./EW_1;
    UD_R = UD_2./UD_1;

    disp(NS_R);
    disp(EW_R);
    disp(UD_R);

    f = (0:length(NS_1)-1)*Fs/length(NS_1);
    figure();
    subplot(3,1,1);
    plot(f,abs(NS_R))
    xlabel('Frequency (Hz)')
    ylabel('Ratio')
    title('N-S Ratio');

    subplot(3,1,2);
    plot(f,abs(EW_R))
    xlabel('Frequency (Hz)')
    ylabel('Ratio')
    title('E-W Ratio');

    subplot(3,1,3);
    plot(f,abs(UD_R))
    xlabel('Frequency (Hz)')
    ylabel('Ratio')
    title('U-D Ratio');

end