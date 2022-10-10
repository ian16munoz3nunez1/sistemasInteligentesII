% Ian Mu;oz Nu;ez
% Ecuacion 2: (x-2)^2 + (y-2)^2 - GA Clasico

close all
clear
clc

f = @(x, y) (x - 2).^2 + (y - 2).^2;
xl = [-5 -5]';
xu = [5 5]';

D = 2;
G = 100;
N = 50;
pm = 0.1;

x = zeros(D, N);
fitness = zeros(1, N);
aptitud = zeros(1, N);

for i=1:N
    x(:, i) = xl + (xu - xl) .* rand(D, 1);
end

conver = zeros(1, G);

for g=1:G

    for i=1:N
        fitness(i) = f(x(1, i), x(2, i));

        if fitness(i) >= 0
            aptitud(i) = 1/(1 + fitness(i));
        else
            aptitud(i) = 1 + abs(fitness(i));
        end
    end

    conver(g) = min(fitness);

    y = zeros(D, N);

    for i=1:2:N
        %%%% Seleccion

        % r1 = ruleta(aptitud); % Opcion 1
        % r1 = ranking(aptitud); % Opcion 2
        r1 = torneo(aptitud); % Opcion 3
        r2 = r1;

        while r1 == r2
            % r2 = ruleta(aptitud); % Opcion 1
            % r2 = ranking(aptitud); % Opcion 2
            r2 = torneo(aptitud); % Opcion 3
        end

        x1 = x(:, r1);
        x2 = x(:, r2);

        %%%% Cruza

        % Opcion 1
        % y1 = x1;
        % y2 = x2;
        % pc = randi([1 D]);
        % Opcion 2
        alpha = rand();
        y1 = alpha*x1 + (1 - alpha)*x2;
        y2 = (1 - alpha)*x1 + alpha*x2;

        y1(pc:D) = x2(pc:D);
        y2(pc:D) = x1(pc:D);

        y(:, i) = y1;
        y(:, i+1) = y2;
    end

    %%%% Mutacion

    for i=1:N
        for j=1:D
            if rand() < pm
                % y(j, i) = xl(j) + (xu(j) - xl(j)) * rand(); % Opcion 1
                y(j, i) = y(j, i) + normrnd(0, 1); % Opcion 2
            end
        end
    end

    x = y;

end

[~, iMejor] = min(fitness);

disp("Minimo global en")
disp([ 'x= ' num2str(x(1, iMejor)) ])
disp([ 'y= ' num2str(x(2, iMejor)) ])
disp([ 'f(x,y)= ' num2str(f(x(1), x(2))) ])

xLim = linspace(xl(1), xu(1), 50);
yLim = linspace(xl(2), xu(2), 50);

[X, Y] = meshgrid(xLim, yLim);
Z = f(X, Y);

figure
hold on
grid on

plot(conver, 'g-', 'LineWidth', 2)

title("Grafica de convergencia", 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)

figure
hold on
grid on

[~, N] = size(x);
fit = zeros(1, N);

for i=1:N
    fit(i) = f(x(1, i), x(2, i));
end

surf(X, Y, Z)
plot3(x(1, :), x(2, :), fit, 'rx', 'LineWidth', 2, 'MarkerSize', 10)
plot3(x(1, :), x(2, :), fit, 'co', 'LineWidth', 2, 'MarkerSize', 10)

title("Algoritmo Genetico Clasico: (x -2)^2 + (y-2)^2", 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
zlabel('f(x,y)', 'FontSize', 15)
axis([xl(1) xu(1) xl(2) xu(2)])

figure
hold on
grid on

contour(X, Y, Z, 20, 'LineWidth', 1.5)
plot(x(1, :), x(2, :), 'rx', 'LineWidth', 2, 'MarkerSize', 10)
plot(x(1, :), x(2, :), 'co', 'LineWidth', 2, 'MarkerSize', 10)

title("Algoritmo Genetico Clasico: (x-2)^2 + (y-2)^2", 'FontSize', 20)
xlabel('x', 'FontSize', 15)
ylabel('y', 'FontSize', 15)
zlabel('f(x,y)', 'FontSize', 15)
axis([xl(1) xu(1) xl(2) xu(2)])

