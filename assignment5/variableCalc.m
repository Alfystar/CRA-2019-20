clear variables
clc

% Variabili non calcolate da Mathematica che servono
% Sin ref
aD2=1;     % Amp d2
wD2=1;   % Freq d2

% Quad dist
aD1=10;
wD1=10;

% Parametri delle matrici
l=1; M=1;F=1;g=9.81;lam=-1;
run("Matrix.m")

cAll=eye(length(Alin));
dAll=zeros(length(Alin),1);

S = [0 0 0
     0 0 wD2
     0 -wD2 0];
bd = zeros(3,1);
cd = [0 1 0; 0 0 1];   % Solo stato sinusoidale
dd = [0;0];

d0 = [aD1;0;aD2];
% d0 = [0;0;0];

x0=[0;1;0;0.3];

time = wD2^-1*2*pi*5; % Tempo parametrico di Simulazione