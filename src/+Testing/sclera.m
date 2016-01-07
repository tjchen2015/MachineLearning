function outImg = sclera(nnPath, testImgPath, channelNum)

import Core.*;

net = load(nnPath);
net = net.net;

testImage = imread(testImgPath);
testImage = im2double(testImage);
[height, width] = size(testImage);

scFeatureSet = scleraFeatureSet(testImage);

output = net(scFeatureSet);
output = reshape(output, width / channelNum, height).';

outImg = output;

end