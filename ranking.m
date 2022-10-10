function k = ranking(aptitud)
    [~, I] = sort(aptitud, 'descend');
    N = numel(aptitud);

    rank = N:-1:1;
    rankTotal = sum(rank);

    r = rand();
    pSum = 0;
    k = N;

    for i=1:N
        pSum = pSum + rank(i)/rankTotal;

        if pSum >= r
            k = I(i);
            break
        end
    end

