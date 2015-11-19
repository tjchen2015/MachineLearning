function featureSet = scleraFeatureSet(I)
%input: test image I
%output: feature set for each image pixel in sclera stage
%feature set: x, y, uH, sigmaH, uCb, sigmaCb, uCr, sigmaCr

imageHSV = rgb2hsv(I);
imageH = imageHSV(:, :, 1);
imageYCbCr = rgb2ycbcr(I);
imageCb = imageYCbCr(:, :, 2);%[0~1]
imageCr = imageYCbCr(:, :, 3);

[height, width] = size(I);

featureSet = cell(height, width);

IIH = integralImage(imageH);%integral image of hue color image
IICb = integralImage(imageCb);%integral image of blue chroma color image
IICr = integralImage(imageCr);%integral image of red chroma color image

for x = 1:height
    for y = 1:width
        %hue color component
        %%%region of radius 0
        uH0 = averageIntensity(IIH, x, y, x, y);
        sigmaH0 = standardDeviation(IIH, x, y, x, y);
        %%%region of radius 3
        uH3 = averageIntensity(IIH, x-1, y-1, x+1, y+1);
        sigmaH3 = standardDeviation(IIH, x-1, y-1, x+1, y+1);
        %%%region of radius 7
        uH7 = averageIntensity(IIH, x-3, y-3, x+1, y+1);
        sigmaH7 = standardDeviation(IIH, x-3, y-3, x+1, y+1);
        
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
        
        %red chroma color component
        %%%region of radius 0
        uCr0 = averageIntensity(IICr, x, y, x, y);
        sigmaCr0 = standardDeviation(IICr, x, y, x, y);
        %%%region of radius 3
        uCr3 = averageIntensity(IICr, x-1, y-1, x+1, y+1);
        sigmaCr3 = standardDeviation(IICr, x-1, y-1, x+1, y+1);
        %%%region of radius 7
        uCr7 = averageIntensity(IICr, x-3, y-3, x+1, y+1);
        sigmaCr7 = standardDeviation(IICr, x-3, y-3, x+1, y+1);
        
        feature = [x, y, uH0, sigmaH0, uH3, sigmaH3, uH7, sigmaH7
            uCb0, sigmaCb0, uCb3, sigmaCb3, uCb7, sigmaCb7
            uCr0, sigmaCr0, uCr3, sigmaCr3, uCr7, sigmaCr7];%features of pixel (x, y)
        featureSet{x, y} = feature;
    end
end