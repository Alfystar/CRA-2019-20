clear variables
clc

% Variabili non calcolate da Mathematica che servono
% Sin ref
aD2=1;     % Amp d2
wD2=0.1;   % Freq d2

% Quad dist
aD1=10;
wD1=10;


run("Matrix.m")

cAll=eye(length(Alin));
dAll=zeros(length(Alin),1);

S = [0 0 0
     0 0 wD2
     0 -wD2 0];
bd = zeros(3,1);
cd = eye(3);

dd = zeros(3,1);

d0 = [aD1;0;aD2];

x0=[0;1;0;1];

% L(1,1)=1;
