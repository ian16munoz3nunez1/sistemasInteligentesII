function plotSurf(f, x, xl, xu)
    cla
    hold on
    grid on

    xLim = linspace(xl(1), xu(1), 50);
    yLim = linspace(xl(2), xu(2), 50);

    [X, Y] = meshgrid(xLim, yLim);
    Z = f(X, Y);

    [~, N] = size(x);
    fit = zeros(1, N);

    for i=1:N
        fit(i) = f(x(1, i), x(2, i));
    end

    surf(X, Y, Z)
    plot3(x(1, :), x(2, :), fit, 'rx', 'LineWidth', 2, 'MarkerSize', 10)
    plot3(x(1, :), x(2, :), fit, 'co', 'LineWidth', 2, 'MarkerSize', 10)

    xlabel('x', 'FontSize', 15)
    ylabel('y', 'FontSize', 15)
    zlabel('f(x,y)', 'FontSize', 15)
    axis([xl(1) xu(1) xl(2) xu(2)])

    pause(0.1)

