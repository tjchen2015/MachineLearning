function centerPos = findCenter( irisImage )
% To find the center of an eye image
%   input a binary irisImage to get the center coordinate centerPos(1) =
%   center column, centerPos(2) = center row.

import Border.*;

centerPos = [];
columnSum = sum(irisImage);
rowSum = sum(irisImage,2);

% find the center peak of columnSum
centerPos(2) = twoValley(columnSum);

% find the center peak of rowSum
centerPos(1) = twoValley(rowSum');

% insert btr
centerPos = round(centerPos);
end

