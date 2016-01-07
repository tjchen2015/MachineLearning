function outImg = iris(nnPath, testImgPath, scleraMaskPath)

import Core.*;

net = load(nnPath);
net = net.net;

testImage = imread(testImgPath);
testImage = im2double(testImage);

[height width] = size(testImage);

detectedSclera = imread(scleraMaskPath);
detectedSclera = im2double(detectedSclera);

generatedIrisFeatureSet = irisFeatureSet(testImage, detectedSclera);

output = net(generatedIrisFeatureSet);
outImg = reshape(output, width, height).';

end