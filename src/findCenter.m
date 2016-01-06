function centerPos = findCenter( irisImage )
% To find the center of an eye image
%   input a binary irisImage to get the center coordinate centerPos(1) =
%   center column, centerPos(2) = center row.

centerPos = [];
columnSum = sum(irisImage);
rowSum = sum(irisImage,2);

% find the center peak of columnSum
centerPos(2) = twoValley(columnSum);

% find the center peak of rowSum
centerPos(1) = twoValley(rowSum');

centerPos = round(centerPos);
end

