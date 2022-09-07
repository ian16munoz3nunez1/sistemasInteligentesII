% octave
close all
clear
clc

f = @(x, y) x .* exp(-x.^2 - y.^2);

xLim = linspace(-2, 2, 50);
yLim = linspace(-2, 2, 50);

h = 0.1;
xi = [-1.4; 0];

for i=1:100
  x = xi(1);
  y = xi(2);

  gx = exp(-x^2-y^2) - 2*x^2*exp(-x^2-y^2);
  gy = -2*x*y*exp(-x^2-y^2);
  g = [gx; gy];

  xi = xi - h*g;
end
disp([ 'gx= ' num2str(xi(1)) ])
disp([ 'gy= ' num2str(xi(2)) ])
disp([ 'f(gx, gy)= ' num2str(f(xi(1), xi(2))) ])

[x, y] = meshgrid(xLim, yLim);

figure
hold on
grid on
title('Grafica en 3D', 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
zlabel('f(x,y)', 'FontSize', 15)

surf(x, y, f(x, y))
plot3(xi(1), xi(2), f(xi(1), xi(2)), 'r*', 'LineWidth', 2, 'MarkerSize', 10)

figure
hold on
grid on
title('Grafica en 2D', 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)

contour(x, y, f(x, y), 20)
plot(xi(1), xi(2), 'r*', 'LineWidth', 2, 'MarkerSize', 10)

