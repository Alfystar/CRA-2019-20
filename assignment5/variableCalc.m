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
% Definizione Sistema Esogeno
S = [0 0 0
     0 0 wD2
     0 -wD2 0];
bd = zeros(3,1);
cd = [0 1 0; 0 0 1];   % Solo stato sinusoidale
dd = [0;0];

% Calcolo Matrici Controll Observer
p=[-10 -10 -5 -5 -3 -3 -4];
G = place(Ae',Ce',p)';
G1=-G([1:4],:); G2=-G([5:7],:);
F = [Alin+G1*Clin+Blin*K , Ptile+G1*Qe+Blin*L
    G2*Clin              ,     S+G2*Qe];
H = [K L];
Doss = [0 0];

% Calcolo Matrici per FIRP
cAll=eye(length(Alin));
dAll=zeros(length(Alin),1);

% Condizioni Iniziali
d0 = [aD1;0;aD2];
oss0 = zeros(7,1);
x0=[0;0;0;0];

% Calcolo del tempo di Simulazione per K periodi
time = wD2^-1*2*pi*10; % Tempo parametrico di Simulazione





