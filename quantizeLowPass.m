F=15;       % With this approach (code), 6 and 7 seems to be the best values for F
load h_L;

% h_Q = round(h_L*2^(F));
% h_Q_fixed = fi(h_Q,1,12);
% h_fixed = bitsra(h_Q_fixed,F);
% h = double(h_fixed);


h = round(h_L*2^(F))*2^(-F);

save('h.mat','h');

[H_freq,v_freq] = freqz(h);

figure(5);
plot(v_freq/(2*pi),20*log(abs(H_freq)),'b',ones(2)*(1/16),[50 -250], 'r--', ones(2)*(1/8),[50 -250], 'k--', [0, 0.5], ones(2)*-40, 'k--');
xlabel('v');
ylabel('20log(|H(v)|)');
title('Frequency reponse of resulting quantizing LPF');
grid;
%%
 
n=0:length(h)-1;
figure(6)
stem(n,h);