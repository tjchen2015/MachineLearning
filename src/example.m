clear
clc

imFile = strcat('ICE/', 'ansIris1.bmp');
irisImage = imread(imFile);
centerPos = findCenter(irisImage)

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

imFile = strcat('ICE/', '1.bmp');
irisImage = imread(imFile);
drawRecogArea( irisImage, centerPos, innerDis, outerDis );

