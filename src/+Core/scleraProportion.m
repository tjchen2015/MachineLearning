function p = scleraProportion(detectedSclera, x, y)
%input: detected sclera (0: sclera pixels; 1: non-sclera pixels)
%output: proportion of pixels that belong to the sclera in 4 directions

import Core.*;

[height, width] = size(detectedSclera);

xRange = x-1:x;
yRange = y-1:y;

if x == 1
    xRange = 1;
end

if y == 1
    yRange = 1;
end
subImage = detectedSclera(yRange, 1:x);
[tmpY, tmpX] = size(subImage);
subImage = reshape(subImage, [tmpX * tmpY, 1]);
pWest = averageIntensity(subImage);

subImage = detectedSclera(yRange, x:width);
[tmpY, tmpX] = size(subImage);
subImage = reshape(subImage, [tmpX * tmpY, 1]);
pEast = averageIntensity(subImage);

subImage = detectedSclera(1:y, xRange);
[tmpY, tmpX] = size(subImage);
subImage = reshape(subImage, [tmpX * tmpY, 1]);
pNorth = averageIntensity(subImage);

subImage = detectedSclera(y:height, xRange);
[tmpY, tmpX] = size(subImage);
subImage = reshape(subImage, [tmpX * tmpY, 1]);
pSouth = averageIntensity(subImage);

p = [pWest; pEast; pNorth; pSouth];