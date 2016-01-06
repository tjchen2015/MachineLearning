for i = 156:156
    testImage = imread(sprintf('../databases/ICE/%d.bmp', i));
    testImage = im2double(testImage);
    
%     detectedSclera = imread(sprintf('../answer/ICE/ansSclera%d.bmp', i));
    detectedSclera = imread(sprintf('../output/image/ICE/sclera%d.bmp', i));
    
    generatedIrisFeatureSet = irisFeatureSet(testImage, im2double(detectedSclera));
    
    filename = ['../feature/ICE/iris/iris' num2str(i)];
    save(filename, 'generatedIrisFeatureSet');
end
