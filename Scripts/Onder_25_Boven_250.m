%% Check whether there is an increase or decrease in lower wind speeds
%% De Kooy
Day = 1
Month = Day * 30
Year = Month * 12
DeKooy = table2array(DeKooyFinal(:,3));
indices = find(isnan(DeKooy));

% convert results to yearly averages
x = DeKooy;
s1 = size(x, 1);
M  = s1 - mod(s1, Day);
y  = reshape(x(1:M), Day, []);
Result = transpose(sum(y, 1) / Day);
% convert wind to wind at height of turbines
karman = 0.4;
z0     = 0.15;
z1     = 10; 
z2     = 135;
Cut_In = 35;
DeKooy_135 = Result*(log(z2/z0)/log(z1/z0));

DeKooyFinal.DeKooy_135 = DeKooy_135;
DeKooyFinal.Low = (DeKooy_135 < Cut_In);
a = DeKooyFinal.VarName2(DeKooyFinal.Low)
y = floor(a / 10000)
i = 1981
total = zeros(38,1);
j = 1
while i < 2019
    counter = (y == i);
    total(j,1) = sum(counter);
    i = i+ 1
    j = j+1
end
subplot(2,2,1)
bar(1981:2018,((total/8760)*100))
xlim = get(gca,'xlim')
hold on
plot(xlim,[13.8 13.8])
% boxplot(total)

% linear relation between number of lower wind speeds and time of lower
% wind speed indicate a relative stable occurence of the lower wind speeds,
% therefore the percentage of wind mills not turning due to low wind can be
% calculated by dividing the total occurences of lower wind speeds by the
% total measurements of wind speeds. The occurence of hours with a mean of 
% 2.5m/s or lower is equally distributed over time in all four weather
% stations. Therefore the percentage 
xlabel('Years')
ylabel('Percent (%)')
title('\fontsize{12}Percentage of time where wind mills stand still, De Kooy 1981-2019')
legend('KNMI data of De Kooy','median')
% percentage of time wind mills not turning for a cut-in value of 35
% 44374/336120 = 0.1320 = 13.3%
%% Eelde
Eelde = table2array(EeldeFinal(:,3));
% convert results to yearly averages
x = Eelde;
s1 = size(x, 1);
M  = s1 - mod(s1, 1);
y  = reshape(x(1:M), 1, []);
Result = transpose(sum(y, 1) / 1);
% convert wind to wind at height of turbines
karman = 0.4;
z0     = 0.15;
z1     = 10; 
z2     = 145;
Cut_In = 35; % wind speed where wind mills starts turning
Eelde_145 = Result*(log(z2/z0)/log(z1/z0));
EeldeFinal.Eelde_145 = Eelde_145;
EeldeFinal.Low = (Eelde_145 < Cut_In);
a = EeldeFinal.YYYYMMDD(EeldeFinal.Low);
y = floor(a / 10000);
i = 1951;
total = zeros(68,1);
j = 1;
while i < 2019
    counter = (y == i);
    total(j,1) = sum(counter);
    i = i+ 1;
    j = j+1;
end
subplot(2,2,2)
bar(1951:2018,((total/8760)*100))
xlim = get(gca,'xlim')
hold on
plot(xlim,[24.71 24.71])
% boxplot(total)


xlabel('Year')
ylabel('Percentage (%)')
title('\fontsize{12}Percentage of time where wind mills stand still, Eelde 1951-2018')
legend('KNMI data of Eelde','median')
% Percentage of time wind mills standing still with a cut-in value of
% 3.5 m/s, measured at hub height. 
% 145487/599088 = 0.2428 = 24.28%
%% Europlatform
Europlatform = table2array(EuroplatformFinal(:,3));
indices = find((Europlatform < 25));
indices = indices / 8760;
Y_1996 = 743;
Y_1997 = 1373 - Y_1996;
Y_1998 = 1978 - Y_1996-Y_1997;
Y_1999 = 2578 - Y_1996-Y_1997-Y_1998;
Y_2000 = 3191 - Y_1996-Y_1997-Y_1998-Y_1999;
Y_2001 = 3686 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000;
Y_2002 = 4285 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001;
Y_2003 = 4992 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002;
Y_2004 = 5549 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003;
Y_2005 = 6239 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004;
Y_2006 = 6782 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005;
Y_2007 = 7328 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006;
Y_2008 = 7832 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007;
Y_2009 = 8452 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008;
Y_2010 = 9079 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009;
Y_2011 = 9524 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010;
Y_2012 = 10039 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010-Y_2011;
Y_2013 = 10856 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010-Y_2011-Y_2012;
Y_2014 = 11235 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010-Y_2011-Y_2012-Y_2013;
Y_2015 = 11591 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010-Y_2011-Y_2012-Y_2013-Y_2014;
Y_2016 = 12215 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010-Y_2011-Y_2012-Y_2013-Y_2014-Y_2015;
Y_2017 = 12737 - Y_1996-Y_1997-Y_1998-Y_1999-Y_2000-Y_2001-Y_2002-Y_2003-Y_2004-Y_2005-Y_2006-Y_2007-Y_2008-Y_2009-Y_2010-Y_2011-Y_2012-Y_2013-Y_2014-Y_2015-Y_2016;
y = [Y_1996,Y_1997,Y_1998,Y_1999,Y_2000,Y_2001,Y_2002,Y_2003,Y_2004,Y_2005,Y_2006,Y_2007,Y_2008,Y_2009,Y_2010,Y_2011,Y_2012,Y_2013,Y_2014,Y_2015,Y_2016,Y_2017];
subplot(2,2,3)
bar(1996:2017,(y/8760)*100)
xlim = get(gca,'xlim')
hold on

% line is the median
plot(xlim,[6.844 6.844])
% boxplot(y)

% specify figure elements
xlabel('Year')
ylabel('Percent (%)')
title('Percentage of time wind mills stand still, Europlatform 1996-2017')
legend('KNMI data of Europlatform','median')

%% AWG-1
AWG = table2array(AWG1Final(:,3));
% convert results to yearly averages
x = AWG;
s1 = size(x, 1);
M  = s1 - mod(s1, 1);
y  = reshape(x(1:M), 1, []);
Result = transpose(sum(y, 1) / 1);
% convert wind to wind at height of turbines
karman = 0.4;
z0     = 0.15;
z1     = 10; 
z2     = 89.5;
Cut_In = 35; % wind speed where wind mills starts turning
AWG_89 = Result*(log(z2/z0)/log(z1/z0));
AWG1Final.AWG_89 = AWG_89;
AWG1Final.Low = (AWG_89 < Cut_In);
a = AWG1Final.VarName2(AWG1Final.Low);
y = floor(a / 10000);
i = 2009;
total = zeros(10,1);
j = 1;
while i < 2019
    counter = (y == i);
    total(j,1) = sum(counter);
    i = i+ 1;
    j = j+1;
end
subplot(2,2,4)
bar(2009:2018,((total/8760)*100))
xlim = get(gca,'xlim')
hold on
plot(xlim,[6.052 6.052])
% boxplot(total)


xlabel('Year')
ylabel('Percentage (%)')
title('Percentage of time where wind mills stand still, AWG-1 2009-2018')
legend('KNMI data of AWG-1','mean')
% Percentage of time wind mills standing still
% 5586/108720 = 0.0514 = 5.14%