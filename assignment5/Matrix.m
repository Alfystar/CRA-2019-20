Alin=[(-1),0,0,0;1,0,0,0;(-1),0,0,0.981E1;0,0,1,0];
Blin=[1;0;1;0];
Clin=[0,1,0,0;0,0,0,1];
Dlin=[0;0];
K=[(-0.194461E1),(-0.269113E0),0.661128E1,0.213724E2];
L=[(-0.1E1),0.269113E0+(-1).*wD2.^2+(-0.213724E2).*wD2.^2.*(0.981E1+ ...
  wD2.^2).^(-1),0.E-323+0.294461E1.*wD2+(-0.661128E1).*wD2.^3.*(0.981E1+ ...
  wD2.^2).^(-1)];
Ptile=[1,0,0;0,0,0;1,0,0;0,0,0];
Gamma=[(-1),(-1).*wD2.^2,wD2];
PiMat=[0,0,wD2;0,1,0;0,0,wD2.^3.*(0.981E1+wD2.^2).^(-1);0,wD2.^2.*(0.981E1+ ...
  wD2.^2).^(-1),0];