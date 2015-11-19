function featureSet = irisFeatureSet(I, detectedSclera)
%input: test image I, detected sclera image 
%output: feature set for each image pixel in iris stage
%feature set: x, y, uS, sigmaS, uCb, sigmaCb, proportion of sclera

%testtesttesttesttesttesttesttest

imageHSV = rgb2hsv(I);
imageS = imageHSV(:, :, 2);
imageYCbCr = rgb2ycbcr(I);
imageCb = imageYCbCr(:, :, 2);%[0~1]

[height, width] = size(I);

featureSet = cell(height, width);

IIS = integralImage(imageS);%integral image of hue color image
IICb = integralImage(imageCb);%integral image of blue chroma color image

for x = 1:height
    for y = 1:width
        %saturation color component
        %%%region of radius 0
        uS0 = averageIntensity(IIS, x, y, x, y);
        sigmaS0 = standardDeviation(IIS, x, y, x, y);
        %%%region of radius 3
        uS3 = averageIntensity(IIS, x-1, y-1, x+1, y+1);
        sigmaS3 = standardDeviation(IIS, x-1, y-1, x+1, y+1);
        %%%region of radius 7
        uS7 = averageIntensity(IIS, x-3, y-3, x+1, y+1);
        sigmaS7 = standardDeviation(IIS, x-3, y-3, x+1, y+1);
        
        %blue chroma color component
        %%%region of radius 0
        uCb0 = averageIntensity(IICb, x, y, x, y);
        sigmaCb0 = standardDeviation(IICb, x, y, x, y);
        %%%region of radius 3
        uCb3 = averageIntensity(IICb, x-1, y-1, x+1, y+1);
        sigmaCb3 = standardDeviation(IICb, x-1, y-1, x+1, y+1);
        %%%region of radius 7
        uCb7 = averageIntensity(IICb, x-3, y-3, x+1, y+1);
        sigmaCb7 = standardDeviation(IICb, x-3, y-3, x+1, y+1);
        
        proportion = scleraProportion(detectedSclera);%proportion of pixels that belong to the sclera in 4 directions
        
        feature = [x, y, uS0, sigmaS0, uS3, sigmaS3, uS7, sigmaS7
            uCb0, sigmaCb0, uCb3, sigmaCb3, uCb7, sigmaCb7, proportion];%features of pixel (x, y)
        featureSet{x, y} = feature;
    end
end