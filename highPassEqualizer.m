load h_L;
M=length(h_L)-1;
n=0:M;

delta = [zeros(1,M/2) 1 zeros(1,(M/2))];  % We choose to affect the middle filter-tap in order to maintain symmetry


h_H = delta - h_L;


figure(4)
stem(n,h_H);
xlabel('n');
ylabel('h_H[n]');
title('Impulse reponse of resulting HPF');

%%

[H_H_freq,v_freq] = freqz(h_H);

figure(2);
plot(v_freq/(2*pi),20*log(abs(H_H_freq)));
xlabel('v');
ylabel('20log(|H_H(v)|)');
title('Frequency reponse of resulting HPF');
grid;
