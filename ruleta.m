function k = ruleta(aptitud)
    p = aptitud/sum(aptitud);

    r = rand();
    pSum = 0;
    N = numel(aptitud);
    k = N;

    for i=1:N
        pSum = pSum + p(i);

        if pSum >= r
            k = i;
            break
        end
    end

