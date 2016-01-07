function centerPos = twoValley( vector )
% To find center peak position in the input vector

import Border.*;

% ignore the warning for clean console box
MSGID = 'MATLAB:polyfit:RepeatedPointsOrRescale';
warning('off', MSGID);

% use polynomial regression and derevitive to get the center position
x = 1:length(vector);
p = polyfit(x, vector, 4);
py = polyval(p, x);
dp = polyder(p);
r = roots(dp);
centerPos = r(2);

warning('on', MSGID);

% figure;
% plot(vector);
% hold on;
% plot(x, py);
% yr = polyval(p, centerPos);
% plot(centerPos, yr, 'r*');
end

