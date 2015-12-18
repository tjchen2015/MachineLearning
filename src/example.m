%% load an eye picture
testImage = imread('testImage.bmp');
testImage = double(testImage);
testImage = testImage/255;


%% find the teacher's answer and draw iris region with red color
eyeNo = 1;
load('ICEcircleinfo.mat');
teacherAns = circleinfo(eyeNo,1:6);
outputImage = drawCorBoundary(testImage, teacherAns);


%% extract sclera features


%% input to sclera network & output a sclera image then "save as scleraImage.bmp"


%% extract 4 proportions of tthe sclera image


%% append 4p to the sclera feature


%% input to iris network & output a iris image then "save as irisImage.bmp"


%% assume we have get iris image
imFile = strcat('C:\Users\Justin\Dropbox\Data Science\MachineLearning\NCU course\ICE\answer\', 'ansIris1.bmp');
irisImage = imread(imFile);
irisImage = double(irisImage);
irisImage = irisImage/255;


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
