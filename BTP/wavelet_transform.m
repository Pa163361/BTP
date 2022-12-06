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
lf = 0.1; % Lower frequency
hf = 49; % Higher frequency

t = 0:0.01:(N-1)*Ts;


%% wavelet transform
figure(2);
cwt(ns0,100);
figure(1);
anss = cwt(ns0,100);
surf(abs(anss));
shading interp;
axis tight;
% figure(2);
% cwt(ew0,100);
% figure(3);
% cwt(ud0,100);
% helperPlotScalogram3d(ns0,Fs);