function H = shannonWiener(ppCounts)
H=0;
    for i=1:length(ppCounts)
        if isnan(ppCounts(i))
            ppCounts(i) = 0;
            H_i = 0;
        elseif ppCounts(i) == 0
            H_i = 0;
        else
            p_i = ppCounts(i)/nansum(ppCounts);
            H_i = p_i * log(p_i);
        end
        H = H + H_i;
    end
    H = -H;
end