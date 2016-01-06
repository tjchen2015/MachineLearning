%% load an eye picture and its file name
testImage = imread('../output/testImage.bmp');
testImage = double(testImage);
testImage = testImage/255;
[rowNo, colNo, deep] = size(testImage);
fid = fopen('../output/eyeClassNo.txt', 'rt');
classPath = fgets(fid);
fileName = fgets(fid);
fclose(fid);
disp('1. Load image success!');

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
disp('2. Draw teacher answer in red success!');

%% extract sclera features
scFeatureSet = getFeature(testImage, class, 'sclera');
disp('3. Extract sclera feature success!');

%% input to sclera network & output a sclera image then "save as scleraImage.bmp"
netPath = ['../output/neural network/', class ,'/sclera/network'];
netPath = strjoin(netPath, '');
netSclera = load(netPath, 'net');
netSclera = netSclera.net;
output = netSclera(scFeatureSet);
%UBIRIS Question
scleraImage = reshape(output, colNo, rowNo).';

imagesc(scleraImage);
colormap gray;
scleraImage = im2bw(scleraImage, 0.7);
imwrite(scleraImage, '../output/scleraImage.bmp');
disp('4. Generate sclera image success!');


%% extract iris features
iFeatureSet = getFeature(testImage, class, 'iris');
disp('5. Extract iris feature success!');

%% input to iris network & output a iris image then "save as irisImage.bmp"
netPath = ['../output/neural network/', class ,'/iris/network'];
netPath = strjoin(netPath, '');
netIris = load(netPath, 'net');
netIris = netIris.net;
output = netIris(iFeatureSet);
irisImage = reshape(output, colNo, rowNo).';

imagesc(irisImage);
colormap gray;
irisImage = im2bw(irisImage, 0.7);
imwrite(irisImage, '../output/irisImage.bmp');
disp('6. Generate iris image success!');


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
outputImage = drawRecogArea( outputImage, centerPos, innerDis, centerPos, outerDis, 'green' );
disp('8. Draw our answer in green success!');

%% compute and save accuracy
flrCenterPos = fliplr(centerPos);
ourAns = [flrCenterPos, innerDis(1), flrCenterPos, outerDis(1)];
accu = accuracy(ourAns, teacherAns);
save('../output/accu.mat', 'accu');
disp('9. Evaluate accuracy success!');

%% save eye Image with iris segmentation
imwrite(outputImage, '../output/outputImage.bmp');
disp('10. Save result image success!');
