net = load('../output/neural network/ICE/sclera/2Layer_40Image_train10');
net = net.net;

imageID = 156;
filename = sprintf('../databases/ICE/%d.bmp', imageID);
testImage = imread(filename);
testImage = im2double(testImage);

scFeatureSet = scleraFeatureSet(testImage);

output = net(scFeatureSet);
output1 = reshape(output, 640, 480).';
% output2 = im2bw(output, 0.7);%binarization
% output2 = reshape(output2, 640, 480).';
imagesc(output1);
colormap gray;

filename1 = ['../output/image/ICE/sclera' num2str(imageID) '.bmp'];
imwrite(output1, filename1);