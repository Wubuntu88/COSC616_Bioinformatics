function BBMS4(DNA, l_mer, iftrace)
disp('Algorithm 4: Branch and Bound Median Search');
%t is the number of rows; n is the number of columns
[t n] = size(DNA);
s = ones(1, l_mer); % # of items in s is equal to t
bestDistance = intmax;
bestWord = num2actg(s);
i = 1;
while i > 0
    if i < l_mer
        prefix = s(1:i);
        word_prefix = num2actg(prefix);
        optimisticScore = totalDistance(word_prefix, DNA);
        if optimisticScore > bestDistance
            [s, i] = byPass(s, i, length(s), 4);
        else
            [s, i] = nextVertex(s, i, length(s), 4);
        end
    else
        word = num2actg(s);
        dist = totalDistance(word, DNA);
        if dist < bestDistance
            fprintf('update best: %s\n', word);
            bestDistance = dist;
            bestWord = word;
        end
        [s, i] = nextVertex(s, i, length(s), 4);
    end
end
fprintf('--final best word: %s\n', bestWord);
fprintf('end\n');
end
        