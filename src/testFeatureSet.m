% function [] = testFeatureSet()

for i = 1:1
    testImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\ICE\\%d.bmp', i));
    testImage = im2double(testImage);
    
    %sclera feature
%     scFeatureSet = scleraFeatureSet(testImage);
    
    %iris feature
    detectedSclera = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\answer\\ansSclera%d.bmp', i));
    detectedSclera = double(detectedSclera);
    irisFeatureSet = irisFeatureSet(testImage, im2double(detectedSclera));
    
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\iris' num2str(i)];
    save(filename, 'irisFeatureSet');
end
