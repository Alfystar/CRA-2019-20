run("variableCalc.m");

% Risposta del sistema in base all'ingresso
sysMec=ss(Alin,Blin,Clin,Dlin);
sysMectf=minreal(tf(sysMec));
figure(1)
bode(sysMectf)
grid on
title("Risposta in frequenza sis Meccanico")

% Risposta dell'osservatore in base all'uscita del sistema
sysOss=ss(FOss,GOss,HOss,Doss);
sysOsstf=minreal(tf(sysOss));
figure(2)
bode(sysOsstf)
grid on
title("Risposta in frequenza Osservatore")


% Risposta Super Sis all'ingresso col disturbo
Asuper = [ Alin       zeros(4,3)    zeros(4,7) 
           zeros(3,4)    S          zeros(3,7)
           GOss*Clin   GOss*Qe        FOss    ];
Bsuper = [Blin ; zeros(3,1) ; zeros(7,1)];
Csuper = [zeros(1,4) zeros(1,3) HOss];
Dsuper = zeros(1,1);

% Risposta del super sistema
sysSuper=ss(Asuper,Bsuper,Csuper,Dsuper);
sysSupertf=minreal(tf(sysSuper));
figure(3)
subplot(1,2,1);
bode(sysSupertf)
grid on
title("Risposta in frequenza da Ud a U")
subplot(1,2,2);
nyquist(sysSupertf)
grid on
title("Risposta in frequenza da Ud a U")
