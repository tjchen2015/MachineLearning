function centerPos = findCenter( irisImage )
% To find the center of an eye image
%   input a binary irisImage to get the center coordinate centerPos(1) =
%   center column, centerPos(2) = center row.

centerPos = [];
columnSum = sum(irisImage);
rowSum = sum(irisImage,2);

% find two valleys of columnSum and produce center coordinate on column
[ leftValley, rightValley ] = twoValley(columnSum);
centerPos(2) = (leftValley + rightValley)/2;

% find two valleys of rowSum and produce center coordinate on row
[leftValley, rightValley] = twoValley(rowSum);
centerPos(1) =  (leftValley + rightValley)/2;

centerPos = round(centerPos);
end

