%% Plot DeKooy daily, monthly or yearly wind velocity on both 10 m and 135 m
close all;
Day = 24
Month = Day * 30
Year = Month * 12
DeKooy = table2array(DeKooyFinal(:,3));
indices = find(isnan(DeKooy));
DeKooy(indices) = [];

% convert results to yearly averages
x = DeKooy;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert wind to wind at height of turbines
karman = 0.4;
z0     = 0.15;
z1     = 10; 
z2     = 135;
DeKooy_135 = Result*(log(z2/z0)/log(z1/z0));

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1981,1,1) + calyears(1:38);
x3 = datetime(1981,1,1) + calyears(1:100);

% linear regression for wind on 10 meters high
mdl1 = fitlm(x1,rot90(Result));
ylin1 = mdl1.Coefficients.Estimate(1) + mdl1.Coefficients.Estimate(2)*x1;

% linear regression for wind on 135 meters high
mdl2 = fitlm(x1,rot90(DeKooy_135));
ylin2 = mdl2.Coefficients.Estimate(1) + mdl2.Coefficients.Estimate(2)*x1;

plot(x2, DeKooy_135)
hold on
plot(x2, Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
title('Mean yearly wind velocity on both 10 and 135 m high, De Kooy 1981-2019')
hold on
plot(x2,ylin1)
hold on
plot(x2,ylin2)
legend('Wind on 135 m high','Wind on 10 m high','Linear regression','Linear regression')
%% Linear regression
% slope on 135 m = -0.2844
% slope on 10 m = -0.1756
%% Plot Eelde daily, monthly or yearly

Eelde = table2array(EeldeFinal(:,3));
indices = find(isnan(Eelde));
Eelde(indices) = [];

% convert results to yearly averages
x = Eelde;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert wind to wind at height of turbines
z0     = 0.15;
z1     = 10; 
z2     = 100;
Eelde_145 = Result*(log(z2/z0)/log(z1/z0));

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1951,1,1) + calyears(1:69);
x3 = datetime(1981,1,1) + calyears(1:100);

% linear regression for wind on 10 meters high
mdl1 = fitlm(x1,rot90(Result));
ylin1 = mdl1.Coefficients.Estimate(1) + mdl1.Coefficients.Estimate(2)*x1;

% linear regression for wind on 135 meters high
mdl2 = fitlm(x1,rot90(Eelde_145));
ylin2 = mdl2.Coefficients.Estimate(1) + mdl2.Coefficients.Estimate(2)*x1;

plot(x2, Eelde_145)
hold on
plot(x2, Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
title('Mean yearly wind velocity on both 10 and 145 m high, Eelde 1951-2019')
hold on
plot(x2,ylin1)
hold on
plot(x2,ylin2)
legend('Wind on 145 m high','Wind on 10 m high','Linear regression','Linear regression')

%% Linear regression
% slope on 10 m = -0.0650
% slope on 145 m = -0.1007
%% Plot Europlatform daily, monthly or yearly
Europlatform = table2array(EuroplatformFinal(:,3));
indices = find(isnan(Europlatform));
Europlatform(indices) = [];

% convert results to yearly averages
x = Europlatform;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert wind to wind at height of turbines
z0     = 0.01;
z1     = 10; 
z2     = 100;
Europlatform_100 = Result*(log(z2/z0)/log(z1/z0));

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1996,1,1) + calyears(1:22);

% linear regression for wind on 10 meters high
mdl1 = fitlm(x1,rot90(Result));
ylin1 = mdl1.Coefficients.Estimate(1) + mdl1.Coefficients.Estimate(2)*x1;

% linear regression for wind on 100 meters high
mdl2 = fitlm(x1,rot90(Europlatform_100));
ylin2 = mdl2.Coefficients.Estimate(1) + mdl2.Coefficients.Estimate(2)*x1;

plot(x2, Europlatform_100)
hold on
plot(x2, Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
hold on
plot(x2,ylin1)
hold on
plot(x2,ylin2)
legend('Wind on 100 m high','Wind on 10 m high','Linear regression','Linear regression')
title('Mean yearly wind velocity on both 10 and 100 m high, Europlatform 1996-2019')
%% Linear regression
% slope on 10 m = -0.0844
% slope on 100 m = -0.1126
%% Plot AWG daily, monthly or yearly
AWG = table2array(AWG1Final(:,3));
indices = find(isnan(AWG));
AWG(indices) = [];
% convert results to yearly averages
x = AWG;
s1 = size(x, 1);
M  = s1 - mod(s1, Year);
y  = reshape(x(1:M), Year, []);
Result = transpose(sum(y, 1) / Year);

% convert wind to wind at height of turbines
z0     = 0.01;
z1     = 10; 
z2     = 89.5;
AWG_89 = Result*(log(z2/z0)/log(z1/z0));
% create linear reg line
x1 = 1:length(Result);
x2 = datetime(2009,1,1) + calyears(1:10);
x3 = datetime(2009,1,1) + calyears(1:100);

% linear regression for wind on 10 meters high
mdl1 = fitlm(x1,rot90(Result));
ylin1 = mdl1.Coefficients.Estimate(1) + mdl1.Coefficients.Estimate(2)*x1;

% linear regression for wind on 89.5 meters high
mdl2 = fitlm(x1,rot90(AWG_89));
ylin2 = mdl2.Coefficients.Estimate(1) + mdl2.Coefficients.Estimate(2)*x1;

plot(x2, AWG_89)
hold on
plot(x2, Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
hold on
plot(x2,ylin1)
hold on
plot(x2,ylin2)
legend('Wind on 89.5 m high','Wind on 10 m high','Linear regression','Linear regression')
title('Mean yearly wind velocity on both 10 and 89.5 m high, AWG 2009-2019')
%% Linear regression
% slope on 10 m = -0.0984
% slope on 89.5 m = -0.1300
    