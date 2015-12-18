% function [] = testFeatureSet()

for i = 1:1
    tic
    testImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\UBIRIS\\%d.bmp', i));
    scFeatureSet = scleraFeatureSet(double(testImage));
    
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc_' num2str(i)];
    save(filename, 'scFeatureSet');
    toc
end

% detectedSclera = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\answer\ansSclera1.bmp');
% detectedSclera = double(detectedSclera);
% irisFeatureSet = irisFeatureSet(testImage, detectedSclera);
