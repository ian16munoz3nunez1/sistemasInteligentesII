function plotContour(f, x, xl, xu)
    cla
    hold on
    grid on

    xLim = linspace(xl(1), xu(1), 50);
    yLim = linspace(xl(2), xu(2), 50);

    [X, Y] = meshgrid(xLim, yLim);
    Z = f(X, Y);

    contour(X, Y, Z, 20);
    plot(x(1, :), x(2, :), 'rx', 'LineWidth', 2, 'MarkerSize', 10)
    plot(x(1, :), x(2, :), 'co', 'LineWidth', 2, 'MarkerSize', 10)

    xlabel('x', 'FontSize', 15)
    ylabel('y', 'FontSize', 15)
    zlabel('f(x,y)', 'FontSize', 15)
    axis([xl(1) xu(1) xl(2) xu(2)])

    pause(0.1)

