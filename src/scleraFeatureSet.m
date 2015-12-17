function featureSet = scleraFeatureSet(I)
%input: test image I, number of image channels
%output: a feature set in matrix form for each image pixel in sclera stage
%feature set: x, y, uH, sigmaH, uCb, sigmaCb, uCr, sigmaCr

[rowCount, colCount, channels] = size(I);
pixelCount = rowCount * colCount;

xPosition = repmat(1:colCount, [1, rowCount]);
yPosition = [];
for i = 1:rowCount
    yPosition = [yPosition, repmat(i, [1, colCount])];
end
featureSet = [xPosition; yPosition];

if channels == 1
    I = I / 255;
    I2 = I.^2;
    
    %%%region of radius 0
    u0 = I;
    u0_2 = I2;
    sigma0 = sqrt(u0_2 - u0.^2);
    featureSet = [featureSet; reshape(u0', [1, pixelCount]); reshape(sigma0', [1, pixelCount])];
    %%%region of radius 3
    u3 = colfilt(I, [3, 3], 'sliding', @averageIntensity);
    u3 = modifyEdge(u3, 3);
    u3_2 = colfilt(I2, [3, 3], 'sliding', @averageIntensity);
    sigma3 = sqrt(u3_2 - u3.^2);
    featureSet = [featureSet; reshape(u3', [1, pixelCount]); reshape(sigma3', [1, pixelCount])];
    %%%region of radius 5
    u5 = colfilt(I, [5, 5], 'sliding', @averageIntensity);
    u5 = modifyEdge(u5, 5);
    u5_2 = colfilt(I2, [5, 5], 'sliding', @averageIntensity);
    sigma5 = sqrt(u5_2 - u5.^2);
    featureSet = [featureSet; reshape(u5', [1, pixelCount]); reshape(sigma5', [1, pixelCount])];
    %%%region of radius 7
    u7 = colfilt(I, [7, 7], 'sliding', @averageIntensity);
    u7 = modifyEdge(u7, 7);
    u7_2 = colfilt(I2, [7, 7], 'sliding', @averageIntensity);
    sigma7 = sqrt(u7_2 - u7.^2);
    featureSet = [featureSet; reshape(u7', [1, pixelCount]); reshape(sigma7', [1, pixelCount])];
    %%%region of radius 9
    u9 = colfilt(I, [9, 9], 'sliding', @averageIntensity);
    u9 = modifyEdge(u9, 9);
    u9_2 = colfilt(I2, [9, 9], 'sliding', @averageIntensity);
    sigma9 = sqrt(u9_2 - u9.^2);
    featureSet = [featureSet; reshape(u9', [1, pixelCount]); reshape(sigma9', [1, pixelCount])];
else
    imageHSV = rgb2hsv(I);
    imageH = imageHSV(:, :, 1);% * 360 [0~1]*360
    imageYCbCr = rgb2ycbcr(I);
    imageCb = imageYCbCr(:, :, 2);% * 255 double[16/255 240/255]*255
    imageCr = imageYCbCr(:, :, 3);% * 255 double[16/255 240/255]*255
    
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
    uH3 = colfilt(imageH, [3, 3], 'sliding', @averageIntensity);
    uH3 = modifyEdge(uH3, 3);
    uH3_2 = colfilt(IH2, [3, 3], 'sliding', @averageIntensity);
    sigmaH3 = sqrt(uH3_2 - uH3.^2);
    featureSet = [featureSet; reshape(uH3', [1, pixelCount]); reshape(sigmaH3', [1, pixelCount])];
    %%%region of radius 7
    uH7 = colfilt(imageH, [7, 7], 'sliding', @averageIntensity);
    uH7 = modifyEdge(uH7, 7);
    uH7_2 = colfilt(IH2, [7, 7], 'sliding', @averageIntensity);
    sigmaH7 = sqrt(uH7_2 - uH7.^2);
    featureSet = [featureSet; reshape(uH7', [1, pixelCount]); reshape(sigmaH7', [1, pixelCount])];
    
    %blue chroma color component
    %%%region of radius 0
    uCb0 = imageCb;
    uCb0_2 = ICb2;
    sigmaCb0 = sqrt(uCb0_2 - uCb0.^2);
    featureSet = [featureSet; reshape(uCb0', [1, pixelCount]); reshape(sigmaCb0', [1, pixelCount])];
    %%%region of radius 3
    uCb3 = colfilt(imageCb, [3, 3], 'sliding', @averageIntensity);
    uCb3 = modifyEdge(uCb3, 3);
    uCb3_2 = colfilt(ICb2, [3, 3], 'sliding', @averageIntensity);
    sigmaCb3 = sqrt(uCb3_2 - uCb3.^2);
    featureSet = [featureSet; reshape(uCb3', [1, pixelCount]); reshape(sigmaCb3', [1, pixelCount])];
    %%%region of radius 7
    uCb7 = colfilt(imageCb, [7, 7], 'sliding', @averageIntensity);
    uCb7 = modifyEdge(uCb7, 7);
    uCb7_2 = colfilt(ICb2, [7, 7], 'sliding', @averageIntensity);
    sigmaCb7 = sqrt(uCb7_2 - uCb7.^2);
    featureSet = [featureSet; reshape(uCb7', [1, pixelCount]); reshape(sigmaCb7', [1, pixelCount])];
    
    %red chroma color component
    %%%region of radius 0
    uCr0 = imageCr;
    uCr0_2 = ICr2;
    sigmaCr0 = sqrt(uCr0_2 - uCr0.^2);
    featureSet = [featureSet; reshape(uCr0', [1, pixelCount]); reshape(sigmaCr0', [1, pixelCount])];
    %%%region of radius 3
    uCr3 = colfilt(imageCr, [3, 3], 'sliding', @averageIntensity);
    uCr3 = modifyEdge(uCr3, 3);
    uCr3_2 = colfilt(ICr2, [3, 3], 'sliding', @averageIntensity);
    sigmaCr3 = sqrt(uCr3_2 - uCr3.^2);
    featureSet = [featureSet; reshape(uCr3', [1, pixelCount]); reshape(sigmaCr3', [1, pixelCount])];
    %%%region of radius 7
    uCr7 = colfilt(imageCr, [7, 7], 'sliding', @averageIntensity);
    uCr7 = modifyEdge(uCr7, 7);
    uCr7_2 = colfilt(ICr2, [7, 7], 'sliding', @averageIntensity);
    sigmaCr7 = sqrt(uCr7_2 - uCr7.^2);
    featureSet = [featureSet; reshape(uCr7', [1, pixelCount]); reshape(sigmaCr7', [1, pixelCount])];
end
