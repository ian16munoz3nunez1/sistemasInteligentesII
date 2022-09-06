% octave
close all
clear
clc

f = @(x_1, x_2) (x_1 - 2).^2 + (x_2 - 2).^2;

xLim = linspace(-5, 5, 50);
yLim = linspace(-5, 5, 50);

[x, y] = meshgrid(xLim, yLim);

h = 0.1;
xi = [-4; -4];

for i=1:200
  x_1 = xi(1);
  x_2 = xi(2);

  gx_1 = 2*(x_1 - 2);
  gx_2 = 2*(x_2 - 2);
  g = [gx_1; gx_2];

  xi = xi - h*g;
end
disp([ 'gx_1= ' num2str(xi(1)) ])
disp([ 'gx_2= ' num2str(xi(2)) ])
disp([ 'f(gx_1, gx_2)= ' num2str(f(xi(1), xi(2))) ])
disp([ 'f(gx_1, gx_2)= ' num2str(fix(f(xi(1), xi(2)))) ])

figure
hold on
grid on
title('Grafica 3D', 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
zlabel('f(x,y)', 'FontSize', 15)

surf(x, y, f(x, y))
plot3(xi(1), xi(2), f(xi(1), xi(2)), 'r*', 'LineWidth', 2, 'MarkerSize', 10)
view([45 45])

figure
hold on
grid on
title('Grafica 2D', 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)

contour(x, y, f(x, y), 20)
plot(xi(1), xi(2), 'r*', 'LineWidth', 2, 'MarkerSize', 10)

