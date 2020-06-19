figure(1)
clf

plot(out.thetaHat_GRAD.Data(:,1),out.thetaHat_GRAD.Data(:,2))
hold on
grid on
plot(out.thetaHat_DREM.Data(:,1),out.thetaHat_DREM.Data(:,2))

plot(b,a,'.c','MarkerSize',30)

legend("Grad","Drem","Obj");
xlabel('Theta1 / b')
ylabel('Theta2 / a')
