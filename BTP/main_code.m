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

%% Reading tables
T0 = readtable(file_names(1));
T1 = readtable(file_names(2));
T2 = readtable(file_names(3));
T3 = readtable(file_names(4));
T4 = readtable(file_names(5));
T5 = readtable(file_names(6));
T6 = readtable(file_names(7));
T7 = readtable(file_names(8));
T8 = readtable(file_names(9));
% T9 = readtable(file_names(10));

Ts = 0.01;
cut_sec = 15;

% % Extracting n-s, e-w, u-d values from each sensor
ns_t = T0{:, 3}; ew_t = T0{:, 4}; ud_t = T0{:, 5};
ns0 = transpose(ns_t); ew0 = transpose(ew_t); ud0 = transpose(ud_t);

ns_t = T1{:, 3}; ew_t = T1{:, 4}; ud_t = T1{:, 5};
ns1 = transpose(ns_t); ew1 = transpose(ew_t); ud1 = transpose(ud_t);

ns_t = T2{:, 3}; ew_t = T2{:, 4}; ud_t = T2{:, 5};
ns2 = transpose(ns_t); ew2 = transpose(ew_t); ud2 = transpose(ud_t);

ns_t = T3{:, 3}; ew_t = T3{:, 4}; ud_t = T3{:, 5};
ns3 = transpose(ns_t); ew3 = transpose(ew_t); ud3 = transpose(ud_t);

ns_t = T4{:, 3}; ew_t = T4{:, 4}; ud_t = T4{:, 5};
ns4 = transpose(ns_t); ew4 = transpose(ew_t); ud4 = transpose(ud_t);

ns_t = T5{:, 3}; ew_t = T5{:, 4}; ud_t = T5{:, 5};
ns5 = transpose(ns_t); ew5 = transpose(ew_t); ud5 = transpose(ud_t);

ns_t = T6{:, 3}; ew_t = T6{:, 4}; ud_t = T6{:, 5};
ns6 = transpose(ns_t); ew6 = transpose(ew_t); ud6 = transpose(ud_t);

ns_t = T7{:, 3}; ew_t = T7{:, 4}; ud_t = T7{:, 5};
ns7 = transpose(ns_t); ew7 = transpose(ew_t); ud7 = transpose(ud_t);

ns_t = T8{:, 3}; ew_t = T8{:, 4}; ud_t = T8{:, 5};
ns8 = transpose(ns_t); ew8 = transpose(ew_t); ud8 = transpose(ud_t);

% % ns_t = T9{:, 3}; ew_t = T9{:, 4}; ud_t = T9{:, 5};
% % ns9 = transpose(ns_t); ew9 = transpose(ew_t); ud9 = transpose(ud_t);
% 
N = length(ns0);
Fs = 1/Ts;
lf = 5; % Lower frequency
hf = 49; % Higher frequency

t = 0:0.01:(N-1)*Ts;

%% Plotting the signal
% plot_signal(t,ns0,ew0,ud0,file_names(1));
% plot_signal(t,ns1,ew1,ud1,file_names(2));
% plot_signal(t,ns2,ew2,ud2,file_names(3));
% plot_signal(t,ns3,ew3,ud3,file_names(4));
% plot_signal(t,ns4,ew4,ud4,file_names(5));
% plot_signal(t,ns5,ew5,ud5,file_names(6));
% plot_signal(t,ns6,ew6,ud6,file_names(7));
% plot_signal(t,ns7,ew7,ud7,file_names(8));
% plot_signal(t,ns8,ew8,ud8,file_names(9));
% plot_signal(t,ns9,ew9,ud9,file_names(10));

%% Applying bandpass filter
[ns0,ew0,ud0] = plot_bw(t,ns0,ew0,ud0,lf,hf,Fs,file_names(1),1);
% [ns1,ew1,ud1] = plot_bw(t,ns1,ew1,ud1,lf,hf,Fs,file_names(2),0);
% [ns2,ew2,ud2] = plot_bw(t,ns2,ew2,ud2,lf,hf,Fs,file_names(3),0);
% [ns3,ew3,ud3] = plot_bw(t,ns3,ew3,ud3,lf,hf,Fs,file_names(4),0);
% [ns4,ew4,ud4] = plot_bw(t,ns4,ew4,ud4,lf,hf,Fs,file_names(5),0);
% [ns5,ew5,ud5] = plot_bw(t,ns5,ew5,ud5,lf,hf,Fs,file_names(6),0);
% [ns6,ew6,ud6] = plot_bw(t,ns6,ew6,ud6,lf,hf,Fs,file_names(7),0);
% [ns7,ew7,ud7] = plot_bw(t,ns7,ew7,ud7,lf,hf,Fs,file_names(8),0);
% [ns8,ew8,ud8] = plot_bw(t,ns8,ew8,ud8,lf,hf,Fs,file_names(9),0);
% [ns9,ew9,ud9] = plot_bw(t,ns9,ew9,ud9,lf,hf,Fs,file_names(10),0);

%% Cut ends
% ns0 = without_ends(ns0,cut_sec,Ts); ew0 = without_ends(ew0,cut_sec,Ts); ud0 = without_ends(ud0,cut_sec,Ts);
% N = length(ns0);
% t = 0:0.01:(N-1)*Ts;
% plot_signal(t,ns0,ew0,ud0,file_names(1));
% ns1 = without_ends(ns1,cut_sec,Ts); ew1 = without_ends(ew1,cut_sec,Ts); ud1 = without_ends(ud1,cut_sec,Ts);
% ns2 = without_ends(ns2,cut_sec,Ts); ew2 = without_ends(ew2,cut_sec,Ts); ud2 = without_ends(ud2,cut_sec,Ts);
ns3 = without_ends(ns3,cut_sec,Ts); ew3 = without_ends(ew3,cut_sec,Ts); ud3 = without_ends(ud3,cut_sec,Ts);
% ns4 = without_ends(ns4,cut_sec,Ts); ew4 = without_ends(ew4,cut_sec,Ts); ud4 = without_ends(ud4,cut_sec,Ts);
% ns5 = without_ends(ns5,cut_sec,Ts); ew5 = without_ends(ew5,cut_sec,Ts); ud5 = without_ends(ud5,cut_sec,Ts);
% ns6 = without_ends(ns6,cut_sec,Ts); ew6 = without_ends(ew6,cut_sec,Ts); ud6 = without_ends(ud6,cut_sec,Ts);
% ns7 = without_ends(ns7,cut_sec,Ts); ew7 = without_ends(ew7,cut_sec,Ts); ud7 = without_ends(ud7,cut_sec,Ts);
% ns8 = without_ends(ns8,cut_sec,Ts); ew8 = without_ends(ew8,cut_sec,Ts); ud8 = without_ends(ud8,cut_sec,Ts);
% ns9 = without_ends(ns9,cut_sec,Ts); ew9 = without_ends(ew9,cut_sec,Ts); ud9 = without_ends(ud9,cut_sec,Ts);

%% Extracting required signal
% [ns0_main,ew0_main,ud0_main] = get_main_signal(ns0,ew0,ud0,Ts);
% new_t = 0:0.01:(length(ns0_main)-1)*Ts;
% figure();
% subplot(3,1,1);
% plot(new_t,ns0_main);
% 
% new_t = 0:0.01:(length(ew0_main)-1)*Ts;
% subplot(3,1,2);
% plot(new_t,ew0_main);
% 
% new_t = 0:0.01:(length(ud0_main)-1)*Ts;
% subplot(3,1,3);
% plot(new_t,ud0_main);
% 
% [ns3_main,ew3_main,ud3_main] = get_main_signal(ns3,ew3,ud3,Ts);

%% Spectrum plotting
% Freq spectrum output can also be taken from the below function:
% [NS,EW,UD]
% freq_spectrum(ns0_main,ew0_main,ud0_main,Fs,file_names(1));
% freq_spectrum(ns1,ew1,ud1,Fs,file_names(2));
% freq_spectrum(ns2,ew2,ud2,Fs,file_names(3));
% freq_spectrum(ns3_main,ew3_main,ud3_main,Fs,file_names(4));
% freq_spectrum(ns4,ew4,ud4,Fs,file_names(5));
% freq_spectrum(ns5,ew5,ud5,Fs,file_names(6));
% freq_spectrum(ns6,ew6,ud6,Fs,file_names(7));
% freq_spectrum(ns7,ew7,ud7,Fs,file_names(8));
% freq_spectrum(ns8,ew8,ud8,Fs,file_names(9));
% freq_spectrum(ns9,ew9,ud9,Fs,file_names(10));

%% Ratio of frequency spectrums of sensors
% cal_ratios(ns0_main,ew0_main,ud0_main,ns3_main,ew3_main,ud3_main,Fs,file_names(1));
% cal_ratios(ns3,ew3,ud3,ns6,ew6,ud6,Fs,file_names(4));
% 
% cal_ratios(ns1,ew1,ud1,ns4,ew4,ud4,Fs,file_names());
% cal_ratios(ns4,ew4,ud4,ns7,ew7,ud7,Fs,file_names());
% 
% cal_ratios(ns2,ew2,ud2,ns5,ew5,ud5,Fs,file_names());
% cal_ratios(ns5,ew5,ud5,ns8,ew8,ud8,Fs,file_names());
