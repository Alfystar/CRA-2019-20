clear variable
clc

% Sistem Param
a = 2; b = 1;
theta = [b;a];

a0 = 0.2; b0 = -1;  %a0 = 0.2; b0 = -1; Adatte per la proiezione, se a troppo vicina, rallenta troppo
thetaZero = [b0;a0];

% Error size
eMax = 0.1;
eMean = 0.1;

% Filter
% Funx Trasf base
s = tf('s');
Lambda = tf([1 1],1);
alphas = tf (1,1);
h1 = tf([1],[1 1]);
h2 = tf([2],[1 2]);

% Funzioni di uso
W = minreal(alphas/Lambda);
H = [h1;h2];


% Estimation system

g1 = 50; g2 = 50;

Gain = [g1 0
        0 g2];
