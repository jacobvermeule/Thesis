function y=acf(x,h,plt)
% y=acf(x,h,plt) gives the autocorrelation function up to lag h.
% if h is not given it is set to one third of the length of x
% if a third argument is given, a plot is drawn,
% In this plot 95% confidence limits are given 
% by dashed lines, to indicate whether the autocorrelation 
% is significant or not

if nargin<2
    h = length(x)/3;
end

y = acvf(x);
y = y(1:h)/y(1);

if nargin == 3
   n=length(y);
   z=zeros(1,n);
   x=[0:(n-1);0:(n-1)];
   a=[z;y];
   plot(x,a,'k');
   hold on;
   plot([0 n-1],[1.96/sqrt(n) 1.96/sqrt(n)],':b',[0 n-1],-ones(1,2)*1.96/sqrt(n),':b');
   hold off;
end

%%%%%%%%%%%%%%%%%%%%%

function y=acvf(Z)
% acvf(Z) sample autocovariance; Brockwell page 17
 Z=Z(:)'-mean(Z);
N = length(Z);
y = filter(Z(N:-1:1),1,Z);
y = y(N:-1:1)/N;
