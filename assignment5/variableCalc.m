clear variables
clc

% Variabili non calcolate da Mathematica che servono
% Sin ref
aD2=2;     % Amp d2
wD2=2;   % Freq d2

% Quad dist
aD1=1;
wD1=1;

% Parametri delle matrici
l=1; M=1;F=1;g=9.81;lam=-2;
run("Matrix.m")
% Definizione Sistema Esogeno
S = [0 0 0
     0 0 wD2
     0 -wD2 0];
bd = zeros(3,1);
cd = [0 1 0; 0 0 1];   % Solo stato sinusoidale
dd = [0;0];

% Calcolo Matrici Controll Observer
p=[-3 -3 -5 -5 -20 -4 -4];
GOss = place(Ae',Ce',p)';
G1=-GOss([1:4],:); G2=-GOss([5:7],:);
FOss = [Alin+G1*Clin+Blin*K , Ptile+G1*Qe+Blin*L
    G2*Clin              ,     S+G2*Qe];
HOss = [K L];
Doss = [0 0];

% Calcolo Matrici per FIRP
cAll=eye(length(Alin));
dAll=zeros(length(Alin),1);

% Condizioni Iniziali
d0 = [aD1;0;aD2];
oss0 = zeros(7,1);
% oss0(5) = aD1; % ampiezza iniziale del distrubi
x0=[0;0;0;0];

% Calcolo del tempo di Simulazione per K periodi
time = wD2^-1*2*pi*10; % Tempo parametrico di Simulazione





