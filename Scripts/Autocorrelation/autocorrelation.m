%% Plot DeKooy daily, monthly or yearly autocorrelation to check for periodicity.
close all;
Day = 24
Month = Day * 30
Year = Month * 12
DeKooy = table2array(DeKooyFinal(:,3));
indices = find(isnan(DeKooy));
DeKooy(indices) = [];

% convert results to daily, monthly or yearly averages
x = DeKooy;
s1 = size(x, 1);
M  = s1 - mod(s1, Month);
y  = reshape(x(1:M), Month, []);
Result = transpose(sum(y, 1) / Month);

% calculate and plot autocorrelation
autocorr = acf(Result)
% subplot(2,2,1)
plot((0:40),autocorr(1:41))
xlabel('Lag (months)')
ylabel('Correlation')
title('Autocorrelation of monthly data, De Kooy')

%% Plot Eelde daily, monthly or yearly autocorrelation to check for periodicity.
Eelde = table2array(EeldeFinal(:,3));
indices = find(isnan(Eelde));
Eelde(indices) = [];

% convert results to daily, monthly or yearly averages
x = Eelde;
s1 = size(x, 1);
M  = s1 - mod(s1, Month);
y  = reshape(x(1:M), Month, []);
Result = transpose(sum(y, 1) / Month);

% calculate and plot autocorrelation
autocorr = acf(Result(5:end,:))
hold on
% subplot(2,2,2)
plot((0:40),autocorr(1:41))
xlabel('Lag (months)')
ylabel('Correlation')
title('Autocorrelation of monthly data, Eelde')
%% Plot Europlatform daily, monthly or yearly autocorrelation to check for periodicity.
Europlatform = table2array(EuroplatformFinal(:,3));
indices = find(isnan(Europlatform));
Europlatform(indices) = [];

% convert results to daily, monthly or yearly averages
x = Europlatform;
s1 = size(x, 1);
M  = s1 - mod(s1, Month);
y  = reshape(x(1:M), Month, []);
Result = transpose(sum(y, 1) / Month);

% calculate and plot autocorrelation
autocorr = acf(Result)
% subplot(2,2,3)
plot((0:40),autocorr(1:41))
xlabel('Lag (months)')
ylabel('Correlation')
title('Autocorrelation of monthly data, Europlatform')
%% Plot AWG-1 daily, monthly or yearly autocorrelation to check for periodicity.
AWG = table2array(AWG1Final(:,3));
indices = find(isnan(AWG));
AWG(indices) = [];

% convert results to daily, monthly or yearly averages
x = AWG;
s1 = size(x, 1);
M  = s1 - mod(s1, Month);
y  = reshape(x(1:M), Month, []);
Result = transpose(sum(y, 1) / Month);

% calculate and plot autocorrelation
autocorr = acf(Result)
% subplot(2,2,4)
plot((0:40),autocorr(1:41))
xlabel('Lag (months)')
ylabel('Correlation')
title('Autocorrelation of monthly data','FontSize',15)
legend('De Kooy','Eelde','Europlatform','AWG-1')