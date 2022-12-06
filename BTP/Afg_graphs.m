% Enter file name correctly according to the uploaded folders and files
% Example: '26_10_15_HDB00/itk00_HDB00.csv'
% Example: '26_10_15_CDG00_PU/itk00_CDG00_PU.csv'
% Example: '22_11_15_CDG00_PU/itk00_CDG00_PU_22.csv'
file_name = '26_10_15_CDG00_PU/itk04_CDG00_PU';
T = readtable(file_name);
rows = T{:, 2};
ns = T{:, 3};
ew = T{:, 4};
ud = T{:, 5};
datee = strcat(file_name,': N-S graph vs Time');
%date = string(T(1,1));

figure();
subplot(3,1,1);
plot(rows,ns);
title(datee, 'Interpreter', 'none');
xlabel('Time');
ylabel('N-S');

subplot(3,1,2);
plot(rows,ew);
title('E-W graph vs Time', 'Interpreter', 'none');
xlabel('Time');
ylabel('E-W');

subplot(3,1,3);
plot(rows,ud);
title('U-D graph vs Time', 'Interpreter', 'none');
xlabel('Time');
ylabel('U-D');