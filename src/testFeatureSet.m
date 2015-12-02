% function [] = testFeatureSet()

for i = 1:10
    testImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\ICE\\%d.bmp', i));
    testImage = double(testImage);
    detectedSclera = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\answer\ansSclera1.bmp');
    detectedSclera = double(detectedSclera);
    irisFeatureSet = irisFeatureSet(testImage, detectedSclera, 1);
    
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\scNew' num2str(i)];
    save(filename, 'scFeatureSet');
end

% scFeatureSet = scleraFeatureSet(testImage, 1);


