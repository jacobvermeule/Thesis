%% Convert wind speed values on 10 m high to wind speed values on 100 m high. 
karman = 0.4;
z0     = 0.01;
z1     = 10; 
z2     = 100;
DeKooy_100 = DeKooy*(log(z2/z0)/log(z1/z0));
% u_ster = ((DeKooy/10)*karman)/(log(z1/z0));
% DeKooy_100 = (u_ster/karman)*log(z2/z0);
plot(DeKooy_100)