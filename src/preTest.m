testImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\ICE\1.bmp');
testImage = double(testImage);
scFeatureSet = scleraFeatureSet(testImage, 1);
scFeatureSet{480,638}

detectedSclera = imread('D:\HomeworkWorkspace\Machine Learning\answer\ansSclera1.bmp');
detectedSclera = double(detectedSclera);
irisFeatureSet = irisFeatureSet(testImage, detectedSclera, 1);