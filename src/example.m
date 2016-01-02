%% load an eye picture and its file name
testImage = imread('testImage.bmp');
testImage = double(testImage);
testImage = testImage/255;

fid = fopen('eyeClassNo.txt', 'rt');
classPath = fgets(fid);
fileName = fgets(fid);
fclose(fid);


%% find the teacher's answer and draw iris region with red color
name = strsplit(fileName, '.');
name = name(1);
eyeNo = str2double(name);
eyeNo = round(eyeNo);
cps= strsplit(classPath, '\');
l = length(cps);
class = cps(l-1);
classPath = ['..\', cps(l-2), '\', class, '\circleinfo'];
answerPath = strjoin(classPath, '');
% load('..\databases\ICE\circleinfo', 'circleinfo');
load(answerPath, 'circleinfo');
teacherAns = circleinfo(eyeNo,1:6);
outputImage = drawCorBoundary(testImage, teacherAns);


%% extract sclera features
scFeatureSet = getFeture(testImage, class, 'sclera');


%% input to sclera network & output a sclera image then "save as scleraImage.bmp"
netPath = ['..\output\neural network\', class, '\sclera\2Layer_40Image_ConcatMatrix_train10']
netSclera = load(netPath, 'net');
netSclera = netSclera.net;
output = netSclera(scFeatureSet);
scleraImage = reshape(output, 640, 480).';

imagesc(scleraImage);
colormap gray;
imwrite(scleraImage, 'scleraImage.bmp');

%% extract iris features
iFeatureSet = getFeture(testImage, class, 'iris');


%% input to iris network & output a iris image then "save as irisImage.bmp"
netPath = ['..\output\neural network\', class, '\iris\2Layer_53Image_train10']
netIris = load(netPath, 'net');
netIris = netIris.net;
output = netIris(iFeatureSet);
irisImage = reshape(output, 640, 480).';

imagesc(irisImage);
colormap gray;
imwrite(irisImage, 'irisImage.bmp');

%% assume we have get iris image
% imFile = strcat('C:\Users\Justin\Dropbox\Data Science\MachineLearning\NCU course\ICE\answer\', 'ansIris1.bmp');
% irisImage = imread(imFile);
% irisImage = double(irisImage);
% irisImage = irisImage/255;

%% find iris center and 2 borders
centerPos = findCenter(irisImage);
innerDis = disCenter(irisImage, centerPos, 1);
% figure;
% plot(innerDis);
% hold on
% innerDis =  polyReg( innerDis, 9);
innerDisMax = max(innerDis);
innerDis = ones(1,length(innerDis));
innerDis = innerDisMax.*innerDis;
% plot(innerDis)
outerDis = disCenter(irisImage, centerPos, 2);
% figure
% plot(outerDis);
% hold on
% outerDis =  polyReg( outerDis, 9);
outerDisMax = max(outerDis);
outerDis = ones(1,length(outerDis));
outerDis = outerDisMax.*outerDis;
% plot(outerDis)

%% draw iris region with green color on output image
outputImage = drawRecogArea( outputImage, centerPos, innerDis, centerPos, outerDis, 'green' );


%% compute and save accuracy
flrCenterPos = fliplr(centerPos);
ourAns = [flrCenterPos, innerDis(1), flrCenterPos, outerDis(1)];
accu = accuracy(ourAns, teacherAns);
save('accu.mat', 'accu');

%% save eye Image with iris segmentation
imwrite(outputImage, 'outputImage.bmp');
