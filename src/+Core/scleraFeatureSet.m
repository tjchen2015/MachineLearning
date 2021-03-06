function featureSet = scleraFeatureSet(I)
%input: test image I
%output: a feature set in matrix form for each image pixel in sclera stage
%feature set: x, y, uH, sigmaH, uCb, sigmaCb, uCr, sigmaCr

import Core.*;

[rowCount, colCount, channels] = size(I);
pixelCount = rowCount * colCount;

xPosition = repmat(1:colCount, [1, rowCount]);
yPosition = [];
for i = 1:rowCount
    yPosition = [yPosition, repmat(i, [1, colCount])];
end
featureSet = [xPosition; yPosition];

if channels == 1
    I2 = I.^2;
    
    %%%region of radius 0
    u0 = I;
    u0_2 = I2;
    sigma0 = sqrt(u0_2 - u0.^2);
    featureSet = [featureSet; reshape(u0', [1, pixelCount]); reshape(sigma0', [1, pixelCount])];
    
    %%%region of radius 3
    u3 = colfilt(I, [7, 7], 'sliding', @averageIntensity);
    u3 = modifyEdge(u3, 3);
    u3_2 = colfilt(I2, [7, 7], 'sliding', @averageIntensity);
    u3_2 = modifyEdge(u3_2, 3);
    
    diff = u3_2 - u3.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigma3 = sqrt(diff);
    
    featureSet = [featureSet; reshape(u3', [1, pixelCount]); reshape(sigma3', [1, pixelCount])];
    
    %%%region of radius 5
    u5 = colfilt(I, [11, 11], 'sliding', @averageIntensity);
    u5 = modifyEdge(u5, 5);
    u5_2 = colfilt(I2, [11, 11], 'sliding', @averageIntensity);
    u5_2 = modifyEdge(u5_2, 5);
    
    diff = u5_2 - u5.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigma5 = sqrt(diff);
    
    featureSet = [featureSet; reshape(u5', [1, pixelCount]); reshape(sigma5', [1, pixelCount])];
    
    %%%region of radius 7
    u7 = colfilt(I, [15, 15], 'sliding', @averageIntensity);
    u7 = modifyEdge(u7, 7);
    u7_2 = colfilt(I2, [15, 15], 'sliding', @averageIntensity);
    u7_2 = modifyEdge(u7_2, 7);
    
    diff = u7_2 - u7.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigma7 = sqrt(diff);
    
    featureSet = [featureSet; reshape(u7', [1, pixelCount]); reshape(sigma7', [1, pixelCount])];
    
    %%%region of radius 9
    u9 = colfilt(I, [19, 19], 'sliding', @averageIntensity);
    u9 = modifyEdge(u9, 9);
    u9_2 = colfilt(I2, [19, 19], 'sliding', @averageIntensity);
    u9_2 = modifyEdge(u9_2, 9);
    
    diff = u9_2 - u9.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigma9 = sqrt(diff);
    
    featureSet = [featureSet; reshape(u9', [1, pixelCount]); reshape(sigma9', [1, pixelCount])];
else
    imageHSV = rgb2hsv(I);
    imageH = imageHSV(:, :, 1);%[0~1]
    imageYCbCr = rgb2ycbcr(I);
    imageCb = imageYCbCr(:, :, 2);%double[16/255 240/255]
    imageCr = imageYCbCr(:, :, 3);%double[16/255 240/255]
    
    IH2 = imageH.^2;
    ICb2 = imageCb.^2;
    ICr2 = imageCr.^2;
    
    %hue color component
    %%%region of radius 0
    uH0 = imageH;
    uH0_2 = IH2;
    sigmaH0 = sqrt(uH0_2 - uH0.^2);
    featureSet = [featureSet; reshape(uH0', [1, pixelCount]); reshape(sigmaH0', [1, pixelCount])];
    
    %%%region of radius 3
    uH3 = colfilt(imageH, [7, 7], 'sliding', @averageIntensity);
    uH3 = modifyEdge(uH3, 3);
    uH3_2 = colfilt(IH2, [7, 7], 'sliding', @averageIntensity);
    uH3_2 = modifyEdge(uH3_2, 3);
    
    diff = uH3_2 - uH3.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaH3 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uH3', [1, pixelCount]); reshape(sigmaH3', [1, pixelCount])];
    
    %%%region of radius 7
    uH7 = colfilt(imageH, [15, 15], 'sliding', @averageIntensity);
    uH7 = modifyEdge(uH7, 7);
    uH7_2 = colfilt(IH2, [15, 15], 'sliding', @averageIntensity);
    uH7_2 = modifyEdge(uH7_2, 7);
    
    diff = uH7_2 - uH7.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaH7 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uH7', [1, pixelCount]); reshape(sigmaH7', [1, pixelCount])];
    
    
    %blue chroma color component
    %%%region of radius 0
    uCb0 = imageCb;
    uCb0_2 = ICb2;
    sigmaCb0 = sqrt(uCb0_2 - uCb0.^2);
    featureSet = [featureSet; reshape(uCb0', [1, pixelCount]); reshape(sigmaCb0', [1, pixelCount])];
    
    %%%region of radius 3
    uCb3 = colfilt(imageCb, [7, 7], 'sliding', @averageIntensity);
    uCb3 = modifyEdge(uCb3, 3);
    uCb3_2 = colfilt(ICb2, [7, 7], 'sliding', @averageIntensity);
    uCb3_2 = modifyEdge(uCb3_2, 3);
    
    diff = uCb3_2 - uCb3.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaCb3 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uCb3', [1, pixelCount]); reshape(sigmaCb3', [1, pixelCount])];
    
    %%%region of radius 7
    uCb7 = colfilt(imageCb, [15, 15], 'sliding', @averageIntensity);
    uCb7 = modifyEdge(uCb7, 7);
    uCb7_2 = colfilt(ICb2, [15, 15], 'sliding', @averageIntensity);
    uCb7_2 = modifyEdge(uCb7_2, 7);
    
    diff = uCb7_2 - uCb7.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaCb7 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uCb7', [1, pixelCount]); reshape(sigmaCb7', [1, pixelCount])];
    
    
    %red chroma color component
    %%%region of radius 0
    uCr0 = imageCr;
    uCr0_2 = ICr2;
    
    diff = uCr0_2 - uCr0.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaCr0 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uCr0', [1, pixelCount]); reshape(sigmaCr0', [1, pixelCount])];
    
    %%%region of radius 3
    uCr3 = colfilt(imageCr, [7, 7], 'sliding', @averageIntensity);
    uCr3 = modifyEdge(uCr3, 3);
    uCr3_2 = colfilt(ICr2, [7, 7], 'sliding', @averageIntensity);
    uCr3_2 = modifyEdge(uCr3_2, 3);
    
    diff = uCr3_2 - uCr3.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaCr3 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uCr3', [1, pixelCount]); reshape(sigmaCr3', [1, pixelCount])];
    
    %%%region of radius 7
    uCr7 = colfilt(imageCr, [15, 15], 'sliding', @averageIntensity);
    uCr7 = modifyEdge(uCr7, 7);
    uCr7_2 = colfilt(ICr2, [15, 15], 'sliding', @averageIntensity);
    uCr7_2 = modifyEdge(uCr7_2, 7);
    
    diff = uCr7_2 - uCr7.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaCr7 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uCr7', [1, pixelCount]); reshape(sigmaCr7', [1, pixelCount])];
end
