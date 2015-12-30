function featureSet = irisFeatureSet(I, detectedSclera)
%input: test image I, detected sclera image, number of image channels
%output: a feature set in matrix form for each image pixel in iris stage
%feature set: x, y, uS, sigmaS, uCb, sigmaCb, proportion of sclera

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
    imageS = imageHSV(:, :, 2);%[0~1]
    imageYCbCr = rgb2ycbcr(I);
    imageCb = imageYCbCr(:, :, 2);%double[16/255 240/255]
    
    IS2 = imageS.^2;
    ICb2 = imageCb.^2;
    
    %saturation color component
    %%%region of radius 0
    uS0 = imageS;
    uS0_2 = IS2;
    sigmaS0 = sqrt(uS0_2 - uS0.^2);
    featureSet = [featureSet; reshape(uS0', [1, pixelCount]); reshape(sigmaS0', [1, pixelCount])];
    
    %%%region of radius 3
    uS3 = colfilt(imageS, [7, 7], 'sliding', @averageIntensity);
    uS3 = modifyEdge(uS3, 3);
    uS3_2 = colfilt(IS2, [7, 7], 'sliding', @averageIntensity);
    uS3_2 = modifyEdge(uS3_2, 3);
    
    diff = uS3_2 - uS3.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaS3 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uS3', [1, pixelCount]); reshape(sigmaS3', [1, pixelCount])];
    
    %%%region of radius 7
    uS7 = colfilt(imageS, [15, 15], 'sliding', @averageIntensity);
    uS7 = modifyEdge(uS7, 7);
    uS7_2 = colfilt(IS2, [15, 15], 'sliding', @averageIntensity);
    uS7_2 = modifyEdge(uS7_2, 7);
    
    diff = uS7_2 - uS7.^2;
    absDiff = abs(diff);
    diff(absDiff < 1e-10) = 0;
    sigmaS7 = sqrt(diff);
    
    featureSet = [featureSet; reshape(uS7', [1, pixelCount]); reshape(sigmaS7', [1, pixelCount])];
    
    
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
end

propFeature = [];
for y = 1:rowCount
    for x = 1:colCount
        proportion = scleraProportion(detectedSclera, x, y);%proportion of pixels that belong to the sclera in 4 directions
        
        propFeature = [propFeature proportion];
    end
end
featureSet = [featureSet; propFeature];