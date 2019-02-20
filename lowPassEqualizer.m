M = 50;    % order of filter, we will have M+1 filter-taps
L = M/2;   % This is a delay to ensure casuality and linear phase for the ideal response
cutoff_freq = 1/16;

n = 0:M;
h_ideal = 2*cutoff_freq*sinc(2*cutoff_freq*(n-L));
w = window(@blackman,M+1)';    % We can try different windows here! (https://se.mathworks.com/help/signal/ref/window.html)
h_L = h_ideal.*w;
save('h_L.mat', 'h_L');    % For use in highPassEqualizer.m and quantizeLowPass.m

figure(1)
stem(n,h_L);
xlabel('n');
ylabel('h_L[n]');
title('Impulse reponse of resulting LPF');
%%
%This is either just unnessescary or maybe even wrong aswell...

H = fft(h_ideal);
v = 0:1/(length(H)-1):1;

figure(2)
plot(v,abs(H))
xlabel('v');
ylabel('H(v)');
title('DFT of resulting LPF');
%%

[H_L_freq,v_freq] = freqz(h_L);

figure(3);
plot(v_freq/(2*pi),20*log(abs(H_L_freq)),'b',ones(2)*(1/16),[50 -350], 'k--', ones(2)*(1/8),[50 -350], 'k--', [0, 0.5], ones(2)*-40, 'k--');
xlabel('v');
ylabel('20log(|H_L(v)|)');
title('Frequency reponse of resulting LPF');
grid;
%axis([0 0.5 -100 20]);

