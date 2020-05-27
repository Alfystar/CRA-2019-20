figure(1)
clf

ax(1) = subplot(2,1,1);
Y = fft(out.eps1_p.Data);
L = length(out.eps1_p.Data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

Fs = 1/out.eps1_p.Time(2);
f = Fs*(0:(L/2))/L;

plot(f,P1) 
grid on
title('Eps1 P frequencies')
xlabel('f (Hz)')
ylabel('|P1(f)|')

ax(2) = subplot(2,1,2);
Y = fft(out.eps1_sp.Data);
L = length(out.eps1_sp.Data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

Fs = 1/out.eps1_sp.Time(2);
f = Fs*(0:(L/2))/L;

plot(f,P1) 
grid on
title('Eps1 SP frequencies')
xlabel('f (Hz)')
ylabel('|P1(f)|')

linkaxes(ax,'xy');
