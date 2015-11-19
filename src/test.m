clear
clc

irisImage = imread('iris.bmp');
centerPos = findCenter(irisImage);
innerDis = disCenter(irisImage, centerPos, 1);
innerDis =  polyReg( innerDis, 6);
outerDis = disCenter(irisImage, centerPos, 2);
plot(outerDis)
hold on
outerDis =  polyReg( outerDis, 6);
plot(outerDis)

drawRecogArea( irisImage, centerPos, innerDis, outerDis )