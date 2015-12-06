%% load an eye picture
testImage = imread('testImage.bmp');
testImage = double(testImage);
testImage = testImage/255;


%% extract sclera features


%% input to sclera network & output a sclera image then "save as scleratImage.bmp"


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
innerDis =  polyReg( innerDis, 9);
% plot(innerDis)
outerDis = disCenter(irisImage, centerPos, 2);
% figure
% plot(outerDis)
% hold on
outerDis =  polyReg( outerDis, 9);
% plot(outerDis)


%% load orginal image and draw iris region
outputImage = drawRecogArea( testImage, centerPos, innerDis, outerDis );


%% save eye Image with iris segmentation
imwrite(outputImage, 'outputImage.bmp');
