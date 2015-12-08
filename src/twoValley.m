function [  leftPos rightPos] = twoValley( vector )
% To find to valley position in the input vector

% search the  two valleys
[pmax, maxIndex, pmin, minIndex] = extrema(vector);

figure;
plot(vector);
hold on;
plot(minIndex, pmin, 'r*');

clear pmax;
clear maxIndex;
clear pmin

leftPos = min(minIndex);
rightPos = max(minIndex);

end

