function turns = segs2turns(segs)
    load turnInfo.mat

    turns = zeros(size(segs));
    for i = 1:numel(segs)
        ind = find(turnInfo(1,:) == segs(i));
        turns(i) = turnInfo(2,ind);
    end
end