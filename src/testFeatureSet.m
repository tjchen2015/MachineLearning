% function [] = testFeatureSet()

for i = 1:30
    testImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\ICE\\%d.bmp', i));
    scFeatureSet = scleraFeatureSet(im2double(testImage));
    
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc' num2str(i)];
    save(filename, 'scFeatureSet');
end

% detectedSclera = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\answer\ansSclera1.bmp');
% detectedSclera = double(detectedSclera);
% irisFeatureSet = irisFeatureSet(testImage, detectedSclera);
