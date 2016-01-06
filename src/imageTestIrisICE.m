net = load('../output/neural network/ICE/iris/2Layer_40Image_train10');
net = net.net;

imageID = 156;
testImageFile = sprintf('../databases/ICE/%d.bmp', imageID);
testImage = imread(testImageFile);
testImage = im2double(testImage);
% detectedScleraFile = sprintf('../answer/ICE/ansSclera%d.bmp', imageID);
detectedScleraFile = sprintf('../output/image/ICE/sclera%d.bmp', i);
detectedSclera = imread(detectedScleraFile);
detectedSclera = im2double(detectedSclera);

irisFeature = irisFeatureSet(testImage, detectedSclera);

output = net(irisFeature);
output1 = reshape(output, 640, 480).';
% output2 = im2bw(output, 0.7);%binarization
% output2 = reshape(output2, 640, 480).';
imagesc(output1);
colormap gray;

filename1 = ['../output/image/ICE/iris' num2str(imageID) '.bmp'];
imwrite(output1, filename1);