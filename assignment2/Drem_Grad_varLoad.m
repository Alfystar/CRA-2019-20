clear variable
clc

% Sistem Param
a = 2; b = 1;
theta = [a;b];

% Sin var a
a_ampl = 0.9;
a_varFreq = 100; %2*pi/(24*3600);

% Error size
eMax = 0.4;

% Filter
s = tf('s');
Lambda = tf(1,[1 1]);
Lambda_S = tf([1 0],[1 1]);

h1 = tf([1],[1 1]);
h2 = tf([2],[1 2]);

H = [h1;h2];


% Estimation system

g1 = 10; g2 = 5;

Gain = [g1 0
        0 g2];

