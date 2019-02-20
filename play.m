% Checking power spectral density

load h;
load h_L;

x= -2^(11) + (2^(11)-(-2^(11))).*rand(100,1);
y=filter(h,1,x);

[pxx_x,w_x] = periodogram(x);
[pxx_y,w_y] = periodogram(y);


figure(1);
plot(w_x/(2*pi),pxx_x,'b', w_y/(2*pi), pxx_y, 'r');
xlabel('v');
ylabel('Power');
grid;