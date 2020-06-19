clear variable
clc

% Sistem Param
a = 2; b = 1;
theta = [a;b];

a0 = 0; b0 = 0;
thetaZero = [a0;b0];

% Sin var a
a_ampl = 0.9;
a_varFreq = 100; %2*pi/(24*3600);

% Error size
eMax = 0.1;

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
