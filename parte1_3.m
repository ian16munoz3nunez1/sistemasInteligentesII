% Ian Munoz Nunez

close all
clear
clc

f = @(x, y) x .* exp(-x.^2 - y.^2);
xl = [-2 -2]';
xu = [2 2]';

xLim = linspace(-2, 2, 50);
yLim = linspace(-2, 2, 50);

[X, Y] = meshgrid(xLim, yLim);
Z = f(X, Y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

G = 1000;
D = 2;
conver = zeros(1, G);

pm = 0.5;
x = xl + (xu - xl) .* rand([D 1]);

for i=1:G
  fx = f(x(1), x(2));
  y = x;

  for j=1:D
    r = rand();
    if r < pm
      y(j) = xl(j) + (xu(j) - xl(j)) * r;
    end
  end

  fy = f(y(1), y(2));
  if fy < fx
    x = y;
  end

  conver(i) = f(x(1), x(2));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('y=')
disp(y)
disp([ 'fy= ' num2str(f(y(1), y(2))) ])
disp('x=')
disp(x)
disp([ 'fx= ' num2str(f(x(1), x(2))) ])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on
grid on

plot(conver, 'b-', 'LineWidth', 2)

title("Grafica de Convergencia", 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('f(x)', 'FontSize', 15)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on
grid on

surf(X, Y, Z)
plot3(x(1), x(2), f(x(1), x(2)), 'rx', 'LineWidth', 2, 'MarkerSize', 10)
plot3(x(1), x(2), f(x(1), x(2)), 'co', 'LineWidth', 2, 'MarkerSize', 10)
plot3(y(1), y(2), f(y(1), y(2)), 'cx', 'LineWidth', 2, 'MarkerSize', 10)
plot3(y(1), y(2), f(y(1), y(2)), 'ro', 'LineWidth', 2, 'MarkerSize', 10)

title("HC Adaptativo: xe^{-x^2 - y^2}", 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
zlabel('f(x,y)', 'FontSize', 15)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on
grid on

contour(X, Y, Z, 20)
plot(x(1), x(2), 'rx', 'LineWidth', 2, 'MarkerSize', 10)
plot(x(1), x(2), 'co', 'LineWidth', 2, 'MarkerSize', 10)
plot(y(1), y(2), 'cx', 'LineWidth', 2, 'MarkerSize', 10)
plot(y(1), y(2), 'ro', 'LineWidth', 2, 'MarkerSize', 10)

title("HC Adaptativo: xe^{-x^2 - y^2}", 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
zlabel('f(x,y)', 'FontSize', 15)

