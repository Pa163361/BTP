%% Reading file names
file_names = ["a" "b" "c" "d" "e" "f" "g" "h" "i" "j"];
ind = 1;
fid = fopen('file_names_CDG00_PU_26_10_15.txt');
tline = fgetl(fid);
while ischar(tline)
    disp(tline);
    file_names(ind) = tline;
    ind = ind + 1;
    tline = fgetl(fid);
end

%% Reading Ground motion data
T0 = readtable(file_names(1));
T1 = readtable(file_names(2));
T2 = readtable(file_names(3));
T3 = readtable(file_names(4));

%% Extracting each direction
ns_t = T0{:, 3}; ew_t = T0{:, 4}; ud_t = T0{:, 5};
ns0 = transpose(ns_t); ew0 = transpose(ew_t); ud0 = transpose(ud_t);

ns_t = T1{:, 3}; ew_t = T1{:, 4}; ud_t = T1{:, 5};
ns1 = transpose(ns_t); ew1 = transpose(ew_t); ud1 = transpose(ud_t);

ns_t = T2{:, 3}; ew_t = T2{:, 4}; ud_t = T2{:, 5};
ns2 = transpose(ns_t); ew2 = transpose(ew_t); ud2 = transpose(ud_t);

ns_t = T3{:, 3}; ew_t = T3{:, 4}; ud_t = T3{:, 5};
ns3 = transpose(ns_t); ew3 = transpose(ew_t); ud3 = transpose(ud_t);

Ts = 0.01;
N = length(ns0);
Fs = 1/Ts;
lf = 0.2; % Lower frequency
hf = 49; % Higher frequency

t = 0:0.01:(N-1)*Ts;

%% Applying bandpass filter
[ns0,ew0,ud0] = plot_bw(t,ns0,ew0,ud0,lf,hf,Fs,file_names(1),0);
[ns1,ew1,ud1] = plot_bw(t,ns1,ew1,ud1,lf,hf,Fs,file_names(2),0);
[ns2,ew2,ud2] = plot_bw(t,ns2,ew2,ud2,lf,hf,Fs,file_names(3),0);
[ns3,ew3,ud3] = plot_bw(t,ns3,ew3,ud3,lf,hf,Fs,file_names(4),0);
plot_signal(t,ns0,ew0,ud0,file_names(1));

%% Extracting required signal
t1 = 240; % in sec
t2 = 430; % in sec
t1 = (t1 * 100) + 1;
t2 = (t2 * 100) + 1;
% disp(t1);
% disp(t2);

[ns0,ew0,ud0] = extract_signal(ns0,ew0,ud0,t1,t2);
[ns1,ew1,ud1] = extract_signal(ns1,ew1,ud1,t1,t2);
[ns2,ew2,ud2] = extract_signal(ns2,ew2,ud2,t1,t2);
[ns3,ew3,ud3] = extract_signal(ns3,ew3,ud3,t1,t2);

N = length(ns0);
t = 0:0.01:(N-1)*Ts;

plot_signal(t,ns0,ew0,ud0,file_names(1));
%plot_signal(t,ns1,ew1,ud1,file_names(2));
%plot_signal(t,ns2,ew2,ud2,file_names(3));

%% Finding peak amplitude
[ns0_amax,ew0_amax,ud0_amax] = find_peak(ns0,ew0,ud0);
[ns1_amax,ew1_amax,ud1_amax] = find_peak(ns1,ew1,ud1);
[ns2_amax,ew2_amax,ud2_amax] = find_peak(ns2,ew2,ud2);
[ns3_amax,ew3_amax,ud3_amax] = find_peak(ns3,ew3,ud3);

disp(ns0_amax);
disp(ew0_amax);
disp(ud0_amax);

disp(ns1_amax);
disp(ew1_amax);
disp(ud1_amax);

disp(ns2_amax);
disp(ew2_amax);
disp(ud2_amax);

%% Plotting energy signal and finding time durations
[ns0_T,ew0_T,ud0_T] = energy_signal(t,ns0,ew0,ud0,Ts);
[ns1_T,ew1_T,ud1_T] = energy_signal(t,ns1,ew1,ud1,Ts);
[ns2_T,ew2_T,ud2_T] = energy_signal(t,ns2,ew2,ud2,Ts);
disp(ns0_T);
disp(ew0_T);
disp(ud0_T);

disp(ns1_T);
disp(ew1_T);
disp(ud1_T);

disp(ns2_T);
disp(ew2_T);
disp(ud2_T);

%% Finding spectrum of the signal
[NS0,EW0,UD0] = freq_spectrum(ns0,ew0,ud0,Fs,file_names(1));
[NS0,EW0,UD0] = half_spectrum(NS0,EW0,UD0);
[NS1,EW1,UD1] = freq_spectrum(ns1,ew1,ud1,Fs,file_names(2));
[NS1,EW1,UD1] = half_spectrum(NS1,EW1,UD1);
[NS2,EW2,UD2] = freq_spectrum(ns2,ew2,ud2,Fs,file_names(3));
[NS2,EW2,UD2] = half_spectrum(NS2,EW2,UD2);
[NS3,EW3,UD3] = freq_spectrum(ns3,ew3,ud3,Fs,file_names(4));
[NS3,EW3,UD3] = half_spectrum(NS3,EW3,UD3);

f = (0:length(NS0)-1)*Fs/length(ns0);

datee = strcat(file_names(1),': N-S spectrum');
figure();
subplot(3,1,1);
plot(f,abs(NS0))
ylim([1000 1000000])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title(datee, 'Interpreter', 'none');

subplot(3,1,2);
plot(f,abs(EW0))
ylim([1000 1000000])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('E-W spectrum');

subplot(3,1,3);
plot(f,abs(UD0))
ylim([1000 1000000])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('U-D spectrum');

%% Smoothening spectrum
[NS0,EW0,UD0] = smoothing(NS0,EW0,UD0);
figure();
subplot(3,1,1);
plot(f,abs(NS0))
ylim([1000 1000000])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title(datee, 'Interpreter', 'none');

subplot(3,1,2);
plot(f,abs(EW0))
ylim([1000 1000000])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('E-W spectrum');

subplot(3,1,3);
plot(f,abs(UD0))
ylim([1000 1000000])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('U-D spectrum');
% 
% 
% [NS0_amax,EW0_amax,UD0_amax] = find_peak(NS0,EW0,UD0);
% % [NS1_amax,EW1_amax,UD1_amax] = find_peak(NS1,EW1,UD1);
% % [NS2_amax,EW2_amax,UD2_amax] = find_peak(NS2,EW2,UD2);
% 
% NS0_rms = NS0_amax/1.414;
% EW0_rms = EW0_amax/1.414;
% UD0_rms = UD0_amax/1.414;
% % 
% [NS0_F1,NS0_F2] = find_freq_range(NS0,NS0_rms,Fs,N);
% disp(NS0_F1);
% disp(NS0_F2);

%% Ratios
% [NS_R,EW_R,UD_R] = cal_ratios(NS0,EW0,UD0,NS3,EW3,UD3,Fs);