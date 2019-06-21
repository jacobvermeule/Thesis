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
x3 = datetime(1981,1,1) + calyears(1:100);

mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*x1;

% plot results and lin reg line
figure;
plot(x2,Result)
hold on
plot(x2,ylin)

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
mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*x1;

% plot results and lin reg line
figure;
plot(x2,Result)
hold on
plot(x2,ylin)
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
mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*x1;

% plot results and lin reg line
figure;
plot(x2,Result)
hold on
plot(x2,ylin)
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
mdl = fitlm(x1,rot90(Result));
ylin = mdl.Coefficients.Estimate(1) + mdl.Coefficients.Estimate(2)*x1;

% plot results and lin reg line
figure;
plot(x2,Result)
hold on
plot(x2,ylin)

    