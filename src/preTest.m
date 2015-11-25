% A = [1,2,3;4,5,6;1,2,3;4,5,6]
% II1 = myIntegralImage(A.^2)
% II = myIntegralImage(A);
% II2 = II.^2
% u = averageIntensity(II,2,2,3,4)
% imageHSV = rgb2hsv(testImage(1:3, 1:4, :));
% for i=1:3
%     disp([min(min(imageHSV(:,:,i))), max(max(imageHSV(:,:,i)))]);
% end
% imageH = imageHSV(:, :, 2)
% imageYCbCr = rgb2ycbcr(testImage(1:3, 1:4, :));
% imageCb = imageYCbCr(:, :, 2)
% imageCr = imageYCbCr(:, :, 3)

testImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\ICE\1.bmp');
testImage = double(testImage);
scFeatureSet = scleraFeatureSet(testImage, 1);
scFeatureSet{480,638}

detectedSclera = imread('D:\HomeworkWorkspace\Machine Learning\answer\ansSclera1.bmp');
detectedSclera = double(detectedSclera);
irisFeatureSet = irisFeatureSet(testImage, detectedSclera, 1);