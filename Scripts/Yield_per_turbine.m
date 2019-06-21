%% Plot DeKooy daily, monthly or yearly wind velocity on both 10 m and 135 m
close all;
Day = 24
Month = Day * 30
Year = Month * 12
DeKooy = table2array(DeKooyFinal(:,3));
indices = find(isnan(DeKooy));
DeKooy(indices) = [];


% values higher than 14 m/s equal yield of 14 m/s
DeKooy(DeKooy > 250) = 0;
DeKooy(DeKooy > 140) = 140;
DeKooy(DeKooy < 45) = 0;



% convert wind to wind at height of turbines and cube
z0     = 0.15;
z1     = 10; 
z2     = 135;
% divided by 10 because units in data are in 0.1 m/s
DeKooy_135 = ((DeKooy/10)*(log(z2/z0)/log(z1/z0)));
DK_2 = DeKooy_135 - 0.875;
DK_2(DK_2 < 0) = 0;
DeKooy_135_cubed = DeKooy_135.^3;
DK_2_cubed = DK_2.^3;

% create future data based on old data

% delete year 2019
DeKooy_135_cubed(332881:end,:) = [];
DK_2_cubed(332881:end,:) = [];

% convert to kWh
d = 127 % m
A = pi*((0.5*d)^2); %m2
Cp = 0.3; % dimensionless
p = 1.23; % kg/m3
DeKooy_Yield_W_1 = 0.5*Cp*A*DeKooy_135_cubed*p;
DK_2_Yield_W_1 =  0.5*Cp*A*DK_2_cubed*p;
percentage_still = 0.138;

% sum every hourly production and create new array of all summed productions per years
DeKooy_Yield_W = sum(reshape(DeKooy_Yield_W_1,8760,38));
DK_2_Yield_W = sum(reshape(DK_2_Yield_W_1,8760,38));

% create linear reg line
x1 = 1:length(DeKooy_Yield_W);
x2 = datetime(1981,1,1) + calyears(1:38);
x3 = datetime(2018,1,1) + calyears(1:38);
DeKooy_Yield_W = (DeKooy_Yield_W/10^6/8760)
DK_2_Yield_W = (DK_2_Yield_W/10^6/8760)


% Plot the potential energy production, but first convert from Wh to MW
figure
subplot(2,2,1)
plot(x2,DeKooy_Yield_W)
hold on
plot(x3,DK_2_Yield_W)
ylim([0 10])
ylabel('Mega Watt (MJ/s)')
xlabel('Year')
title('Potential energy production per turbine, Noordoostpolder 1981-2056')
legend('Yield based on KNMI data De Kooy','Linear regression')

%% Linear regression
% slope on 135 m = -0.2844
% slope on 10 m = -0.1756
%% Plot Eelde daily, monthly or yearly

Eelde = table2array(EeldeFinal(:,3));
indices = find(isnan(Eelde));
Eelde(indices) = [];

% values higher than 14 m/s equal yield of 14 m/s
Eelde(Eelde > 250) = 0;
Eelde(Eelde > 140) = 140;
Eelde(Eelde < 35) = 0;
% convert wind to wind at height of turbines and cube
z0     = 0.15;
z1     = 10; 
z2     = 145;
Eelde_145 = ((Eelde/10)*(log(z2/z0)/log(z1/z0)));
Eelde_2 = Eelde_145 - 1.9870;
Eelde_2(Eelde_2 < 0) = 0;
Eelde_145_cubed = Eelde_145.^3;
Eelde_2_cubed = Eelde_2.^3;

% delete year 2019
Eelde_145_cubed(595681:end,:) = [];
Eelde_2_cubed(595681:end,:) = [];

% convert to kWh
A = pi*((0.5*131)^2); %m2
Cp = 0.3; % dimensionless
p = 1.23; % kg/m3
Eelde_Yield_W_1 = 0.5*Cp*A*Eelde_145_cubed*p;
Eelde_2_Yield_W_1 = 0.5*Cp*A*Eelde_2_cubed*p;

percentage_still = 0.2471;

% sum every hourly production and create new array of all summed productions per years
Eelde_Yield_W = sum(reshape(Eelde_Yield_W_1,8760,68));
Eelde_2_Yield_W = sum(reshape(Eelde_2_Yield_W_1,8760,68));

% convert from Wh to MW
Eelde_Yield_W = (Eelde_Yield_W/10^6/8760);
Eelde_2_Yield_W = (Eelde_2_Yield_W/10^6/8760);

% create linear reg line
x1 = 1:length(Eelde_Yield_W);
x2 = datetime(1951,1,1) + calyears(1:68);
x3 = datetime(2018,1,1) + calyears(1:68);



% Plot the potential energy production
subplot(2,2,2)
plot(x2,Eelde_Yield_W)
hold on
plot(x3,Eelde_2_Yield_W)
ylim([0 10])
ylabel('Mega Watt (MJ/s)')
xlabel('Year')
title('Potential energy production per turbine, Drentse Monden 1951-2086')
legend('Yield based on KNMI data Eelde','Linear regression')


%% Linear regression
% slope on 10 m = -0.0650
% slope on 145 m = -0.1007
%% Plot Europlatform daily, monthly or yearly
Europlatform = table2array(EuroplatformFinal(:,3));
indices = find(isnan(Europlatform));
Europlatform(indices) = [];

% values higher than 14 m/s equal yield of 14 m/s
Europlatform(Europlatform > 250) = 0;
Europlatform(Europlatform > 140) = 140;
Europlatform(Europlatform < 45) = 0;
% convert wind to wind at height of turbines and cube
z0     = 0.01;
z1     = 10; 
z2     = 100;
% divided by 10 because units in data are in 0.1 m/s
Europlatform_100 = ((Europlatform/10)*(log(z2/z0)/log(z1/z0)));
E_2 = Europlatform_100 - 0.28;
E_2(E_2 < 0) = 0;
Europlatform_100_cubed = Europlatform_100.^3;
E_2_cubed = E_2.^3;

% delete year 2019
Europlatform_100_cubed(1:4416,:) = [];
Europlatform_100_cubed(192721:end,:) = [];
E_2_cubed(1:4416,:) = [];
E_2_cubed(192721:end,:) = [];

% convert to kWh
d = 167 % m
A = pi*((0.5*d)^2); %m2
Cp = 0.3; % dimensionless
p = 1.23; % kg/m3
Europlatform_Yield_W_1 = 0.5*Cp*A*Europlatform_100_cubed*p;
E_2_Yield = 0.5*Cp*A*E_2_cubed*p;

percentage_still = 0.138;

% sum every hourly production and create new array of all summed productions per years
Europlatform_Yield_W = sum(reshape(Europlatform_Yield_W_1,8760,22));
E_2_Yield = sum(reshape(E_2_Yield,8760,22));

% convert from Wh to MW
Europlatform_Yield_W = (Europlatform_Yield_W/10^6/8760)
E_2_Yield = (E_2_Yield/10^6/8760)

% create linear reg line
x1 = 1:length(Europlatform_Yield_W);
x2 = datetime(1997,1,1) + calyears(1:22);
x3 = datetime(2019,1,1) + calyears(1:22);

% Plot the potential energy production
subplot(2,2,3)
plot(x2,Europlatform_Yield_W)
hold on
plot(x3,E_2_Yield)
ylim([0 10])
ylabel('Mega Watt (MJ/s)')
xlabel('Year')
title('Potential energy production per turbine, Borssele 1997-2041')
legend('Yield based on KNMI data Europlatform','Linear regression')

%% Linear regression
% slope on 10 m = -0.0844
% slope on 100 m = -0.1126
%% Plot AWG daily, monthly or yearly
AWG = table2array(AWG1Final(:,3));
indices = find(isnan(AWG));
AWG(indices) = []; 

% values higher than 14 m/s equal yield of 14 m/s
AWG(AWG > 250) = 0;
AWG(AWG > 140) = 140;
AWG(AWG < 45) = 0;
% convert wind to wind at height of turbines and cube
z0     = 0.01;
z1     = 10; 
z2     = 89.5;
% divided by 10 because units in data are in 0.1 m/s
AWG_89 = ((AWG/10)*(log(z2/z0)/log(z1/z0)));
A_2 = AWG_89 - 0.116;
A_2(A_2 < 0) = 0;
AWG_89_cubed = AWG_89.^3;
A_2_cubed = A_2.^3;

% delete year 2019
AWG_89_cubed(87601:end,:) = [];
A_2_cubed(87601:end,:) = [];

% convert to kWh
d = 130 % m
A = pi*((0.5*d)^2); %m2
Cp = 0.3; % dimensionless
p = 1.23; % kg/m3
AWG_Yield_W_1 = 0.5*Cp*A*AWG_89_cubed*p;
A_2_cubed = 0.5*Cp*A*A_2_cubed*p;

percentage_still = 0.138;

% sum every hourly production and create new array of all summed productions per years
AWG_Yield_W = sum(reshape(AWG_Yield_W_1,8760,10));
A_2_cubed = sum(reshape(A_2_cubed,8760,10));

% convert from Wh/year to MW
AWG_Yield_W = (AWG_Yield_W/10^6/8760)
A_2_cubed = (A_2_cubed/10^6/8760)

% create linear reg line
x1 = 1:length(AWG_Yield_W);
x2 = datetime(2009,1,1) + calyears(1:10);
x3 = datetime(2018,1,1) + calyears(1:10);



% Plot the potential energy production
subplot(2,2,4)
plot(x2,AWG_Yield_W)
hold on
plot(x3,A_2_cubed)
ylim([0 10])
ylabel('Mega Watt (MJ/s)')
xlabel('Year')
title('Potential energy production per turbine, Gemini 2009-2029')
legend('Yield based on KNMI data AWG-1','Linear regression')

    