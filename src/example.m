clear
clc

irisImage = imread('ansIris1.bmp');
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

irisImage = imread('ansIris1.bmp');
drawRecogArea( irisImage, centerPos, innerDis, outerDis );

