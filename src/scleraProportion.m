function p = scleraProportion(detectedSclera)
%input: detected sclera (0: sclera pixels; 1: non-sclera pixels)
%output: proportion of pixels that belong to the sclera in 4 directions

[height, width] = size(detectedSclera);

II = integralImage(detectedSclera);

for x = 1:height
    for y = 1:width
        pWest = averageIntensity(II, 1, y-1, x, y);
        pEast = averageIntensity(II, x, y-1, width, y);
        pNorth = averageIntensity(II, x-1, 1, x, y);
        pSouth = averageIntensity(II, x-1, y, x, height);
    end
end

p = [pWest, pEast, pNorth, pSouth];