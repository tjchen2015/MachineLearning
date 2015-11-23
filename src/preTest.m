testImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\ICE\1.bmp');

scFeatureSet = scleraFeatureSet(testImage, size(testImage, 1));

detectedSclera = imread('D:\HomeworkWorkspace\Machine Learning\answer\ansSclera1.bmp');
irisFeatureSet = irisFeatureSet(testImage, detectedSclera, 1);