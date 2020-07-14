clc
% scene Parameter
xMin = -5; xMax = 5; % Da ottenere in base alle sovraelongazioni della simulazione
yMin = -1; yMax = 3; % Da ottenere in base alla lunghezza dell'asta  
% abs(xMin)+abs(xMax)-abs(yMin)
figure(1)
clf
hold on
grid on
box on
axis equal
axis([xMin xMax yMin yMax]);

% disegniamo lo sfondo della scena
GND = fill([xMin xMin xMax xMax],[0 yMin yMin 0],hex2Vet('#0B6623'));
GND.LineWidth = 1;

lCart=1; hCart = 0.5;

lBar = 1; ratiusBall = 0.05;
CartSize = [lCart hCart lBar ratiusBall];



STATE = out.X.Data;
D = out.D.Data;
U = out.U.Data;
t = [0.01;diff(out.tout)];

for i=1:length(STATE)
scene(STATE(i,:),D(i,:),U(i),t(i),CartSize);
end



% X = [sDot, s, PhiDot, phi]
% D = [Cost, sin, cos]
% U = u
% nextStepTime = time for animation
% CartSize = [lCart, hCart, lBar, ratiusBall]
function scene(State,D,U,nextStepTime, CartSize)
    theta = 0:0.01:2*pi;
    hAdd = CartSize(4)*2;

    % Disegno Carrello     
    Xcart = [-CartSize(1)/2 -CartSize(1)/2 CartSize(1)/2 CartSize(1)/2];
    Ycart = [0         CartSize(2)   CartSize(2)    0];
    s = State(2);
    cart = patch(s+Xcart,hAdd+Ycart,hex2Vet('#0000F0'));
    
    Xwheels = CartSize(4)*cos(theta);
    Ywheels= CartSize(4)*sin(theta);
    wheel1 = fill(s+CartSize(1)/3+Xwheels,Ywheels+hAdd/2,hex2Vet('#c5c7c4')); 
    wheel2 = fill(s-CartSize(1)/3-Xwheels,Ywheels+hAdd/2,hex2Vet('#c5c7c4')); 

    % Asta    
    Xbar = [0 cos(State(4)+pi/2)*CartSize(3)];
    Ybar = [0 sin(State(4)+pi/2)*CartSize(3)];
    
    bar = line(s+Xbar,hAdd+CartSize(2)+Ybar);
    bar.Color = hex2Vet('#555c5f');
    bar.LineWidth = 1;
    
    ball = fill(s+Xbar(2)+Xwheels,hAdd+CartSize(2)+Ybar(2)+Ywheels,hex2Vet('#c5c7c4')); 

    % RiferimentoAsta    
    rif = fill(D(2)+Xwheels,-0.5+Ywheels,hex2Vet('#ff0000')); 

    % Controll and Disturb     
    
    sizeArrow = 1/8;
    Xarrow = [0 -1 -1 -4 -4 -4 -4 -1 -1]*sizeArrow/10;
    Yarrow = [0 -1 -0.5 -0.5 -0.5 -0.5 0.5 0.5 1]*sizeArrow;
    uArrow = fill(s-CartSize(1)/2+Xarrow*U,hAdd/2+Yarrow,hex2Vet('#00ff00')); 
    dArrow = fill(s-CartSize(1)/2+Xarrow*D(1),hAdd/2+CartSize(2)+Yarrow,hex2Vet('#ff5500')); 
    TotArrow = fill(s-CartSize(1)/2+Xarrow*(U+D(1)),-0.5+Yarrow,hex2Vet('#ff00ff')); 

%     offset = max(CartSize(1)*2, CartSize(3)*1.5);
%     axis([s-offset s+offset -1 -1+offset])

    
    pause(nextStepTime)
    
    % Pulizzia Carrello
    delete(cart)
    delete(wheel1)
    delete(wheel2)
    delete(bar)
    delete(ball)
    delete(rif)
    delete(uArrow)
    delete(dArrow)
    delete(TotArrow)
    
end

function [c] = hex2Vet (str)
% Neet to use '' and NOT ""
% Convert color code to 1-by-3 RGB array (0~1 each)
c = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
end