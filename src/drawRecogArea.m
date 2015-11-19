function drawRecogArea( irisImage, centerPos, innerDis, outerDis )
%DRAWRECOGAREA draw the iris area by inner and outer border on the given
%iris  image.
%   irisImage - the given background image
%   innerDis - the inner-border distance w.r.t. center postion
%   outerDis - the outer-border distance w.r.t. center postion

%convert binary image to RGB image
irisImage = im2uint8(irisImage);

%prepare cos and sin values
L = length(innerDis);
angle = [1:L];
sinValue = sin(angle.*2.*pi./180);
cosValue = cos(angle.*2.*pi./180);
tri = [cosValue; sinValue];    % combine cos and sin values into [sin, cos, sin, cos,...]
tri = tri(:)';

%prepare center x-y coordinates
centerN = centerPos(1);
centerN = centerN*ones(1, L);
centerM = centerPos(2);
centerM = centerM*ones(1, L);
center = [centerM; centerN];
center = center(:)';

% evaluate x-y coordinates of inner polygon
innerDis = [innerDis; innerDis];
innerDis = innerDis(:)';
innerCoordinates = center+ innerDis.*tri;
% round them into integer
innerCoordinates = round(innerCoordinates);

% evaluate x-y coordinates of outer polygon
outerDis = [ outerDis; outerDis];
outerDis = outerDis(:)';
outerCoordinates = center + outerDis.*tri;
% round them into integer
outerCoordinates = round(outerCoordinates);

%draw inner and outer polygon by lines
irisImage = insertShape(irisImage, 'Line', {innerCoordinates, outerCoordinates}, 'Color', {'red', 'green'}, 'Opacity', 0.7, 'LineWidth', 2);

%show image
figure;
imshow(irisImage);

end

