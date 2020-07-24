clear variable
clc

% Sistem Params
a = 1; a_m = -1;

[AWm,BWm,CWm ,DWm] = tf2ss(1,[1 -a_m]);
[A,B,C ,D] = tf2ss(1,[1 -a]);

x0Wm = 10;
x0Gs = 15;

sogliaSat = 1000000;


% Variazioni di a
a_ampl = 10;
a_varFreq = 1/10;

% a_ampl = 1/10;
% a_varFreq = 10; %2*pi/(24*3600);


% Error size
eMax = 1;

% Estimation param
gamma = 1;