function featureSet = irisFeatureSet(I, detectedSclera, imageChannel)
%input: test image I, detected sclera image, number of image channels
%output: a cell array feature set for each image pixel (a cell) in iris stage
%feature set: x, y, uS, sigmaS, uCb, sigmaCb, proportion of sclera

if imageChannel == 1
    II = myIntegralImage(I);
else
    imageHSV = rgb2hsv(I);
    imageS = imageHSV(:, :, 2) * 100;%[0~1]*100??
    imageYCbCr = rgb2ycbcr(I);
    imageCb = imageYCbCr(:, :, 2) * 255;%double[16/255 240/255]*255
    
    IIS = myIntegralImage(imageS);%integral image of hue color image
    IICb = myIntegralImage(imageCb);%integral image of blue chroma color image
end

[height, width] = size(I);

featureSet = cell(height, width);

for x = 1:width
    for y = 1:height
        if imageChannel == 1
            %%%region of radius 0
            u0 = averageIntensity(II, x, y, x, y);
            sigma0 = standardDeviation(II, x, y, x, y);
            %%%region of radius 3
            u3 = averageIntensity(II, x-1, y-1, x+1, y+1);
            sigma3 = standardDeviation(II, x-1, y-1, x+1, y+1);
            %%%region of radius 5
            u5 = averageIntensity(II, x-2, y-2, x+2, y+2);
            sigma5 = standardDeviation(II, x-2, y-2, x+2, y+2);
            %%%region of radius 7
            u7 = averageIntensity(II, x-3, y-3, x+3, y+3);
            sigma7 = standardDeviation(II, x-3, y-3, x+3, y+3);
            %%%region of radius 9
            u9 = averageIntensity(II, x-4, y-4, x+4, y+4);
            sigma9 = standardDeviation(II, x-4, y-4, x+4, y+4);
            
            feature = [x, y, u0, sigma0, u3, sigma3, u5, sigma5, u7, sigma7, u9, sigma9];%features of pixel (x, y)
        else
            %saturation color component
            %%%region of radius 0
            uS0 = averageIntensity(IIS, x, y, x, y);
            sigmaS0 = standardDeviation(IIS, x, y, x, y);
            %%%region of radius 3
            uS3 = averageIntensity(IIS, x-1, y-1, x+1, y+1);
            sigmaS3 = standardDeviation(IIS, x-1, y-1, x+1, y+1);
            %%%region of radius 7
            uS7 = averageIntensity(IIS, x-3, y-3, x+1, y+1);
            sigmaS7 = standardDeviation(IIS, x-3, y-3, x+3, y+3);

            %blue chroma color component
            %%%region of radius 0
            uCb0 = averageIntensity(IICb, x, y, x, y);
            sigmaCb0 = standardDeviation(IICb, x, y, x, y);
            %%%region of radius 3
            uCb3 = averageIntensity(IICb, x-1, y-1, x+1, y+1);
            sigmaCb3 = standardDeviation(IICb, x-1, y-1, x+1, y+1);
            %%%region of radius 7
            uCb7 = averageIntensity(IICb, x-3, y-3, x+1, y+1);
            sigmaCb7 = standardDeviation(IICb, x-3, y-3, x+3, y+3);
            
            feature = [x, y, uS0, sigmaS0, uS3, sigmaS3, uS7, sigmaS7, uCb0, sigmaCb0, uCb3, sigmaCb3, uCb7, sigmaCb7];%features of pixel (x, y)
        end
        
        proportion = scleraProportion(detectedSclera, x, y);%proportion of pixels that belong to the sclera in 4 directions
        
        featureSet{y, x} = [feature, proportion];
    end
end