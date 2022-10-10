function k = torneo(aptitud)
    N = numel(aptitud);
    tau = round(N*0.3);

    I = randi(N, [1 tau]);
    [~, i] = max(aptitud(I));

    k = I(i);

