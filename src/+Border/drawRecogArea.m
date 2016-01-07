function outputImage = drawRecogArea( irisImage, innerCenterPos, innerDis, outercenterPos, outerDis, color )
%DRAWRECOGAREA draw the iris area by inner and outer border on the given
%iris  image.
%   outputImage - the eye Image with iris Segmentation
%   irisImage - the given background image
%   innerDis - the inner-border distance w.r.t. center postion
%   outerDis - the outer-border distance w.r.t. center postion

import Border.*;

%convert binary image to RGB image
irisImage = im2uint8(irisImage);

%prepare cos and sin values
L = length(innerDis);
angle = [1:L];
sinValue = sin(angle.*2.*pi./180);
cosValue = cos(angle.*2.*pi./180);
tri = [cosValue; sinValue];    % combine cos and sin values into [sin, cos, sin, cos,...]
tri = tri(:)';

%prepare center x-y coordinates inner boundary
centerN = innerCenterPos(1);
centerN = centerN*ones(1, L);
centerM = innerCenterPos(2);
centerM = centerM*ones(1, L);
center = [centerM; centerN];
center = center(:)';

% evaluate x-y coordinates of inner polygon
innerDis = [innerDis; innerDis];
innerDis = innerDis(:)';
innerCoordinates = center+ innerDis.*tri;
% round them into integer
innerCoordinates = round(innerCoordinates);

%prepare center x-y coordinates for outer boundary
centerN = outercenterPos(1);
centerN = centerN*ones(1, L);
centerM = outercenterPos(2);
centerM = centerM*ones(1, L);
center = [centerM; centerN];
center = center(:)';

% evaluate x-y coordinates of outer polygon
outerDis = [ outerDis; outerDis];
outerDis = outerDis(:)';
outerCoordinates = center + outerDis.*tri;
% round them into integer
outerCoordinates = round(outerCoordinates);

%draw inner and outer polygon by lines
irisImage = insertShape(irisImage, 'Line', {innerCoordinates, outerCoordinates}, 'Color', {color, color}, 'Opacity', 0.7, 'LineWidth', 4);

outputImage = irisImage;
end

