function example(classPath, fileName, testImage)

import Core.*;
import Border.*

%% load an eye picture and its file name
[rowCount, colCount, channels] = size(testImage);
disp('1. Load image successfully!');

%% find the teacher's answer and draw iris region with red color
name = strsplit(fileName, '.');
name = name(1);
eyeNo = str2double(name);
eyeNo = round(eyeNo);
cps= strsplit(classPath, '\');
l = length(cps);
class = cps(l-1);
classPath = ['../', cps(l-2), '/', class, '/circleinfo'];
answerPath = strjoin(classPath, '');
% load('../databases/ICE/circleinfo', 'circleinfo');
load(answerPath, 'circleinfo');
teacherAns = circleinfo(eyeNo,1:6);
outputImage = drawCorBoundary(testImage, teacherAns);
disp('2. Draw teacher answer in red successfully!');

%% extract sclera features
testImage = im2double(testImage);
scFeatureSet = scleraFeatureSet(testImage);
disp('3. Extract sclera feature successfully!');

%% input to sclera network & output a sclera image then "save as scleraImage.bmp"
if channels==1
%     scleraNet = load('../output/neural network/ICE/sclera/2Layer_40Image_ConcatMatrix_train10');
    scleraNet = load('../output/neural network/ICE/sclera/network');
else
%     scleraNet = load('../output/neural network/UBIRIS/sclera/UBIRIS_2Layer_53Image_ConcatMatrix_train1');
    scleraNet = load('../output/neural network/UBIRIS/sclera/network');
end
scleraNet = scleraNet.net;
scOutput = scleraNet(scFeatureSet);
scleraImage = reshape(scOutput, colCount, rowCount).';

imagesc(scleraImage);
colormap gray;
scleraImage = im2bw(scleraImage, 0.4);
global sclera;
sclera = scleraImage;
disp('4. Generate sclera image successfully!');

%% extract iris features
generatedIrisFeatureSet = irisFeatureSet(testImage, scleraImage);
disp('5. Extract iris feature successfully!');

%% input to iris network & output a iris image then "save as irisImage.bmp"
if channels==1
%     irisNet = load('../output/neural network/ICE/iris/2Layer_40Image_train10');
    irisNet = load('../output/neural network/ICE/iris/network');
else
%     irisNet = load('../output/neural network/UBIRIS/iris/2Layer_53Image_train10');
    irisNet = load('../output/neural network/UBIRIS/iris/network');
end
irisNet = irisNet.net;
irisOutput = irisNet(generatedIrisFeatureSet);
irisImage = reshape(irisOutput, colCount, rowCount).';

imagesc(irisImage);
colormap gray;
irisImage = im2bw(irisImage, 0.4);
global iris;
iris = irisImage;
disp('6. Generate iris image successfully!');


%% find iris center and 2 borders
centerPos = findCenter(irisImage);
innerDis = disCenter(irisImage, centerPos, 1);
innerDisMax = max(innerDis);
innerDis = ones(1,length(innerDis));
innerDis = innerDisMax.*innerDis;
outerDis = disCenter(irisImage, centerPos, 2);
outerDisMax = max(outerDis);
outerDis = ones(1,length(outerDis));
outerDis = outerDisMax.*outerDis;
disp('7. Find the center point and 2 borders success!');

%% draw iris region with green color on output image
global result;
result = drawRecogArea( outputImage, centerPos, innerDis, centerPos, outerDis, 'green' );
disp('8. Draw our answer in green successfully!');

%% compute and save accuracy
flrCenterPos = fliplr(centerPos);
ourAns = [flrCenterPos, innerDis(1), flrCenterPos, outerDis(1)];
global accu;
accu = accuracy(ourAns, teacherAns);
disp('9. Evaluate accuracy successfully!');

%% save eye image with iris segmentation
outputImage2 = drawRecogArea( testImage, centerPos, innerDis, centerPos, outerDis, 'green' );
path = ['../answer/', class, '/', int2str(eyeNo), '.bmp'];
path = strjoin(path, '');
imwrite(outputImage2, path);
disp('10. Save result image successfully!');
