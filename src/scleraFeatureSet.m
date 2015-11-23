function featureSet = scleraFeatureSet(I, imageChannel)
%input: test image I, number of image channels
%output: feature set for each image pixel in sclera stage
%feature set: x, y, uH, sigmaH, uCb, sigmaCb, uCr, sigmaCr

if imageChannel == 1
    II = integralImage(I);
else
    imageHSV = rgb2hsv(I);
    imageH = imageHSV(:, :, 1);
    imageYCbCr = rgb2ycbcr(I);
    imageCb = imageYCbCr(:, :, 2);%[0~1]
    imageCr = imageYCbCr(:, :, 3);

    IIH = integralImage(imageH);%integral image of hue color image
    IICb = integralImage(imageCb);%integral image of blue chroma color image
    IICr = integralImage(imageCr);%integral image of red chroma color image
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
            %hue color component
            %%%region of radius 0
            uH0 = averageIntensity(IIH, x, y, x, y);
            sigmaH0 = standardDeviation(IIH, x, y, x, y);
            %%%region of radius 3
            uH3 = averageIntensity(IIH, x-1, y-1, x+1, y+1);
            sigmaH3 = standardDeviation(IIH, x-1, y-1, x+1, y+1);
            %%%region of radius 7
            uH7 = averageIntensity(IIH, x-3, y-3, x+3, y+3);
            sigmaH7 = standardDeviation(IIH, x-3, y-3, x+3, y+3);

            %blue chroma color component
            %%%region of radius 0
            uCb0 = averageIntensity(IICb, x, y, x, y);
            sigmaCb0 = standardDeviation(IICb, x, y, x, y);
            %%%region of radius 3
            uCb3 = averageIntensity(IICb, x-1, y-1, x+1, y+1);
            sigmaCb3 = standardDeviation(IICb, x-1, y-1, x+1, y+1);
            %%%region of radius 7
            uCb7 = averageIntensity(IICb, x-3, y-3, x+3, y+3);
            sigmaCb7 = standardDeviation(IICb, x-3, y-3, x+3, y+3);

            %red chroma color component
            %%%region of radius 0
            uCr0 = averageIntensity(IICr, x, y, x, y);
            sigmaCr0 = standardDeviation(IICr, x, y, x, y);
            %%%region of radius 3
            uCr3 = averageIntensity(IICr, x-1, y-1, x+1, y+1);
            sigmaCr3 = standardDeviation(IICr, x-1, y-1, x+1, y+1);
            %%%region of radius 7
            uCr7 = averageIntensity(IICr, x-3, y-3, x+3, y+3);
            sigmaCr7 = standardDeviation(IICr, x-3, y-3, x+3, y+3);
        
            feature = [x, y, uH0, sigmaH0, uH3, sigmaH3, uH7, sigmaH7, uCb0, sigmaCb0, uCb3, sigmaCb3, uCb7, sigmaCb7, uCr0, sigmaCr0, uCr3, sigmaCr3, uCr7, sigmaCr7];%features of pixel (x, y)
        end
        featureSet{x, y} = feature;
    end
end