%% Plot DeKooy daily, monthly or yearly
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

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1981,1,1) + calyears(1:38);
x3 = datetime(1981,1,1) + calyears(1:120);

mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*(1:length(x3));

% plot results and lin reg line
figure;
plot(x2,Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
hold on
plot(x3,ylin)
legend('KNMI data from De Kooy','Linear regression')
title('Prediction mean yearly wind velocity, De Kooy 1981-2050')
%% Yearly De Kooy
% 48.75 for 2050, 39.97 for 2100
% slope = -0.1756
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

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1950,1,1) + calyears(1:69);
x3 = datetime(1950,1,1) + calyears(1:150);

mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*(1:length(x3));

% plot results and lin reg line
figure;
plot(x2,Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
hold on
plot(x3,ylin)
legend('KNMI data from Eelde','Linear regression')
title('Prediction mean yearly wind velocity, Eelde 1981-2050')
%% Yearly Eelde
% 39.63 mean in 2050, 36.38 in 2100
% slope = -0.0650
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

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(1996,1,1) + calyears(1:22);
x3 = datetime(1996,1,1) + calyears(1:104);

mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*(1:length(x3));

% plot results and lin reg line
figure;
plot(x2,Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
hold on
plot(x3,ylin)
legend('KNMI data from Europlatform','Linear regression')
title('Prediction mean yearly wind velocity, Europlatform 1996-2100')
%% Yearly Europlatform
% 74.28 for 2050, 70.06 for 2100
% slope = -0.0844
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

% create linear reg line
x1 = 1:length(Result);
x2 = datetime(2009,1,1) + calyears(1:10);
x3 = datetime(2009,1,1) + calyears(1:91);
mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*(1:length(x3));

% plot results and lin reg line
figure;
plot(x2,Result)
xlabel('Years')
ylabel('Wind velocity (0.1 m/s)')
hold on
plot(x3,ylin)
legend('KNMI data from AWG-1','Linear regression')
title('Prediction mean yearly wind velocity, AWG-1 2009-2100')
%% Yearly AWG-1
% 65.68 for 2050, 60.77 for 2100
% slope = -0.0984