function p = scleraProportion(detectedSclera)
%input: detected sclera (0: sclera pixels; 1: non-sclera pixels)
%output: proportion of pixels that belong to the sclera in 4 directions

[height, width] = size(detectedSclera);

II = integralImage(detectedSclera);

for x = 1:height %??????????????????????
    for y = 1:width
        if detectedSclera(x, y) ~= 0
            continue
        end
        
        pWest = averageIntensity()
        pEast
        pNorth
        pSouth
    end
end

p = [pWest, pEast, pNorth, pSouth];