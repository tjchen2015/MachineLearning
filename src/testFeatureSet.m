% function [] = testFeatureSet()

for i = 170:185
    testImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\ICE\\%d.bmp', i));
    testImage = double(testImage);
    scFeatureSet = scleraFeatureSet(testImage, 1);
    
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc' num2str(i)];
    save(filename, 'scFeatureSet');
end

% detectedSclera = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera1.bmp');
% detectedSclera = double(detectedSclera);
% irisFeatureSet = irisFeatureSet(testImage, detectedSclera, 1);
