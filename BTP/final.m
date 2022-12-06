% Enter the text file name consists of .csv file names

fid = fopen('file_names_CDG00_PU_26_10_15.txt');
tline = fgetl(fid);
while ischar(tline)
    disp(tline);

    % main_code
    temp = '.csv';
    file_name = tline;
    T = readtable(file_name);
    
    rows_t = T{:, 2};
    ns_t = T{:, 3};
    ew_t = T{:, 4};
    ud_t = T{:, 5};

    rows = transpose(rows_t);
    ns = transpose(ns_t);
    ew = transpose(ew_t);
    ud = transpose(ud_t);

    % Edited code
    N = length(rows);
    disp(N);
    Ts = 0.01;
    Fs = 1/Ts;
    t = 0:0.01:((N-1)*0.01);

    % 1st part
    lower_hz = 0.1;
    higher_hz = (Fs/2) - (Fs/N);
    NS_b = bandpass(ns,[0.1 49],Fs);
    figure();
    plot(t,NS_b);
    title('Bandlimited signal');

    % 2nd part

    NS = fft(ns);
    f = (0:length(NS)-1)*Fs/length(NS);
    figure();
    plot(f,abs(NS))
    ylim([1000 1000000])
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    title('Magnitude')
    
    % Till here
    

    datee = strcat(file_name,': N-S graph vs Time');
    
    figure();
    subplot(3,1,1);
    plot(t,ns);
    title(datee, 'Interpreter', 'none');
    xlabel('Time');
    ylabel('N-S');
    
    subplot(3,1,2);
    plot(t,ew);
    title('E-W graph vs Time', 'Interpreter', 'none');
    xlabel('Time');
    ylabel('E-W');
    
    subplot(3,1,3);
    plot(t,ud);
    title('U-D graph vs Time', 'Interpreter', 'none');
    xlabel('Time');
    ylabel('U-D');

    tline = fgetl(fid);
end
fclose(fid);