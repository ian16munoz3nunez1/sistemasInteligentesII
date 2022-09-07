% octave
close all
clear
clc

x = 0:0.1:10;

% f = @(x) x .* (20 - 2*x).^2;
f = @(x) 4*x.^3 - 80*x.^2 + 400*x;
df = @(x) 12*x.^2 - 160*x + 400;
ddf = @(x) 24*x - 160;

n = 10;
xi = 3;

for i=1:n
  xi = xi - df(xi)/ddf(xi);
end

if ddf(xi) >= 0
  disp(['Valor minimo en x=' num2str(xi)])
  disp(['Valor de f(x)=' num2str(f(xi))])
else
  disp(['Valor maximo en x=' num2str(xi)])
  disp(['Valor de f(x)=' num2str(f(xi))])
end

figure
hold on
grid on
title('Metodo de Newton', 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('f(x)', 'FontSize', 15)

plot(x, f(x), 'b-', 'LineWidth', 2)
plot(x, df(x), 'g--', 'LineWidth', 2)
plot(x, ddf(x), 'r-.', 'LineWidth', 2)
plot(xi, f(xi), 'm*', 'LineWidth', 2, 'MarkerSize', 10)
legend('f(x)', 'df(x)', 'ddf(x)', 'Maximo')

