clear variables
clc

% Variabili non calcolate da Mathematica che servono
aD2=1;     % Amp d2
wD2=0.1;   % Freq d2

aD1=0.5;
wD1=50;


run("Matrix.m")

cAll=eye(length(Alin));
dAll=zeros(length(Alin),1);

x0=[0;0;0;0];