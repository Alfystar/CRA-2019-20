% NOTA simulazione DEVE essere a tempo fisso
figure(1)
clf

ax(1) = subplot(2,1,1);
L = length(out.eps1_p.Data);
L = floor(L/2);
data = out.eps1_p.Data(L:end);

Y = fft(data);
L = length(data);
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

L = length(out.eps1_p.Data);
L = floor(L/2);
data = out.eps1_sp.Data(L:end);

Y = fft(out.eps1_sp.Data);
L = length(data);
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
