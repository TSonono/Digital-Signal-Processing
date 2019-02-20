load h;
load h_L;

x = -2^(11) + (2^(11)-(-2^(11))).*rand(10000000,1);   % uniformly distributed white noise between 2^11 and 2^11

x_LQ = filter(h,1,x);
x_L = filter(h_L,1,x);
x_error = x_L - x_LQ;   % (noise)
%x_LQ = conv(h,x);
%x_L = conv(h_L,x);

N= length(x_L);
n=0:N-1;


%power_x_L = (norm(x_L)^2)/length(x_L);
%power_x_error = (norm(x_error)^2)/length(x_error);
power_x_L = sum(abs(x_L).^2)/length(x_L);
power_x_error = sum(abs(x_error).^2)/length(x_error);
%power_x_L = bandpower(x_L);
%power_x_error = bandpower(x_error);
sq = power_x_L/power_x_error;
sq_dB = 10*log(sq)



% does the signal withhold its uniform distribution after filtering?
% does the range of the uniform distribution change?

sum_L = 0; sum_error = 0;
for i = 1:length(x_L)
    sum_L = sum_L + (x_L(i).^2)*(1/(2*(2^11)));
    sum_error = sum_error + (x_error(i).^2)*(1/(2*(2^11)));
end
sqnr = sum_L/sum_error;
sqnr_dB = 10*log(sqnr)

%%
    
%  X = fft(x);
%  k1 = -0.5:1/(length(X)-1):0.5;
%  figure(1)
%  plot(k1,abs(X));

figure(1);
title('x_L');
stem(n,x_L);

figure(2)
title('x_LQ');
stem(n,x_LQ);

figure(3);
title('x_L-x_LQ');
stem(n,x_L-x_LQ);
axis([0 100 -1000 600])



