%% Plot DeKooy daily, monthly or yearly wind velocity on both 10 m and 135 m
close all;
Day = 24
Month = Day * 30
Year = Month * 12
DeKooy = table2array(DeKooyFinal(:,3));
indices = find(isnan(DeKooy));
DeKooy(indices) = [];

% convert wind to wind at height of turbines
karman = 0.4;
z0     = 0.15;
z1     = 10; 
z2     = 135;
DeKooy_135 = ((DeKooy/10)*(log(z2/z0)/log(z1/z0)));

% create future data based on old data
DK_2 = DeKooy_135 - 0.875;
DK_2(DK_2 < 0) = 0;

% convert results to yearly averages
x = DeKooy_135;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert results to yearly averages
x = DK_2;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result2 = transpose(sum(y, 1) / Year);

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1981,1,1) + calyears(1:38);
x3 = datetime(2018,1,1) + calyears(1:38);

subplot(2,2,1)
plot(1981:2018, Result)
hold on
plot(2018:2055,Result2)
ylim([1 12])
xlabel('Years')
ylabel('Wind velocity (m/s)')
title('Prediction mean annual wind velocity on 135 m altitude, De Kooy 1981-2056')
legend('Wind, 135 m','Predicted wind, 135 m')
%% Linear regression
% slope on 135 m = -0.2844
% slope on 10 m = -0.1756
%% Plot Eelde daily, monthly or yearly

Eelde = table2array(EeldeFinal(:,3));
indices = find(isnan(Eelde));
Eelde(indices) = [];
% convert wind to wind at height of turbines
z0     = 0.15;
z1     = 10; 
z2     = 100;
Eelde_145 = ((Eelde/10)*(log(z2/z0)/log(z1/z0)));

% create future data based on old data
Eelde_2 = Eelde_145 - 1.9870;
Eelde_2(Eelde_2 < 0) = 0;

% convert results to yearly averages
x = Eelde_145;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert results to yearly averages
x = Eelde_2;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result2 = transpose(sum(y, 1) / Year);

% create future wind data
x2 = datetime(1951,1,1) + calyears(1:69);
x3 = datetime(2019,1,1) + calyears(1:69);

subplot(2,2,2)
plot(1951:2019, Result)
hold on
plot(2019:2087,Result2)
ylim([1 12])

xlabel('Years')
ylabel('Wind velocity (m/s)')
title('Prediction mean annual wind velocity on 145 m altitude, Eelde 1951-2088')
legend('Wind, 145 m','Predicted wind, 145 m')
%% Linear regression
% slope on 10 m = -0.0650
% slope on 145 m = -0.1007
%% Plot Europlatform daily, monthly or yearly
Europlatform = table2array(EuroplatformFinal(:,3));
indices = find(isnan(Europlatform));
Europlatform(indices) = [];

% convert wind to wind at height of turbines
z0     = 0.01;
z1     = 10; 
z2     = 100;
Europlatform_100 = ((Europlatform/10)*(log(z2/z0)/log(z1/z0)));
% create future data based on old data
Europlatform_2 = Europlatform_100 - 0.28;
Europlatform_2(Europlatform_2 < 0) = 0;

% convert results to yearly averages
x = Europlatform_100;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert results to yearly averages
x = Europlatform_2;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result2 = transpose(sum(y, 1) / Year);

% create future wind data
x2 = datetime(1997,1,1) + calyears(1:22);
x3 = datetime(2019,1,1) + calyears(1:22);

subplot(2,2,3)
plot(1997:2018, Result)
hold on
plot(2020:2041,Result2)
ylim([1 12])
xlabel('Years')
ylabel('Wind velocity (m/s)')
title('Prediction mean annual wind velocity on 100 m altitude, Europlatform 1997-2041')
legend('Wind, 100 m','Predicted wind, 100 m')

%% Plot AWG daily, monthly or yearly
AWG = table2array(AWG1Final(:,3));
indices = find(isnan(AWG));
AWG(indices) = []; 

% convert wind to wind at height of turbines and cube
z0     = 0.01;
z1     = 10; 
z2     = 89.5;
% divided by 10 because units in data are in 0.1 m/s
AWG_89 = ((AWG/10)*(log(z2/z0)/log(z1/z0)));
% create future data based on old data
AWG_2 = AWG_89 - 0.116;
AWG_2(AWG_2 < 0) = 0;

% convert results to yearly averages
x = AWG_2;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert results to yearly averages
x = AWG_2;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result2 = transpose(sum(y, 1) / Year);

% create future wind data
x2 = datetime(2009,1,1) + calyears(1:10);
x3 = datetime(2018,1,1) + calyears(1:10);

subplot(2,2,4)
plot(2009:2018,Result)
hold on
plot(2018:2027,Result2)
ylim([1 12])
xlabel('Years')
ylabel('Wind velocity (m/s)')
title('Prediction mean annual wind velocity on 89.5 m altitude, AWG-1 2009-2027')
legend('Wind, 89.5 m','Predicted wind, 89.5 m')
