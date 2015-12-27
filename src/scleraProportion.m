function p = scleraProportion(detectedSclera, x, y)
%input: detected sclera (0: sclera pixels; 1: non-sclera pixels)
%output: proportion of pixels that belong to the sclera in 4 directions

[height, width] = size(detectedSclera);

% if y == 1
    

subImage = detectedSclera(1:x, y-1:y);
pWest = averageIntensity(subImage);

subImage = detectedSclera(x:width, y-1:y);
pEast = averageIntensity(subImage);

subImage = detectedSclera(x-1:x, 1:y);
pNorth = averageIntensity(subImage);

subImage = detectedSclera(x-1:x, y:height);
pSouth = averageIntensity(subImage);

p = [pWest; pEast; pNorth; pSouth];