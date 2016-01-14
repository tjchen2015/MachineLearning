import Core.*;
import Border.*;

scleraNet = load('../output/neural network/ICE/sclera/2Layer_45Image_ConcatMatrix_train10');
scleraNet = scleraNet.net;
irisNet = load('../output/neural network/ICE/iris/2Layer_45Image_ConcatMatrix_train10');
irisNet = irisNet.net;

rowCount = 480;
colCount = 640;

firstImageID = 1;
lastImageID = 1;

accuracyMat = [];
for i = firstImageID:lastImageID
    i
    filename = sprintf('../databases/ICE/%d.bmp', i);
    testImage = imread(filename);
    testImage = im2double(testImage);
    
    %sclera stage
    scFeatureSet = scleraFeatureSet(testImage);
    
    scOutput = scleraNet(scFeatureSet);
    scleraImage = reshape(scOutput, colCount, rowCount).';
    scleraImage = im2bw(scleraImage, 0.4);
    
    %iris stage
    generatedIrisFeatureSet = irisFeatureSet(testImage, scleraImage);
    
    irisOutput = irisNet(generatedIrisFeatureSet);
    irisImage = reshape(irisOutput, colCount, rowCount).';
    irisImage = im2bw(irisImage, 0.4);
    
    %calculate accuracy
    load('../databases/ICE/circleinfo', 'circleinfo');
    teacherAns = circleinfo(i,1:6);
    
    centerPos = findCenter(irisImage);
    innerDis = disCenter(irisImage, centerPos, 1);
    innerDisMax = max(innerDis);
    innerDis = ones(1,length(innerDis));
    innerDis = innerDisMax.*innerDis;
    outerDis = disCenter(irisImage, centerPos, 2);
    outerDisMax = max(outerDis);
    outerDis = ones(1,length(outerDis));
    outerDis = outerDisMax.*outerDis;
    
    flrCenterPos = fliplr(centerPos);
    ourAns = [flrCenterPos, innerDis(1), flrCenterPos, outerDis(1)];
    imageAccuracy = accuracy(ourAns, teacherAns);
    accuracyMat = [accuracyMat; imageAccuracy];
end

accuracyFilename = ['../output/ICEAccuracy_' num2str(firstImageID) 'to' num2str(lastImageID) '.mat'];
save(accuracyFilename, 'accuracyMat');