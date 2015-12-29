% function [] = testFeatureSet()

for i = 1:1
    testImage = imread(sprintf('../databases/ICE/%d.bmp', i));
    testImage = im2double(testImage);
    
    %sclera feature
%     scFeatureSet = scleraFeatureSet(testImage);
    
    %iris feature
    detectedSclera = imread(sprintf('../databases/answer/ansSclera%d.bmp', i));
    irisFeatureSet = irisFeatureSet(testImage, double(detectedSclera)/255);
    
    filename = ['../feature/ICE/iris' num2str(i)];
    save(filename, 'irisFeatureSet');
end
