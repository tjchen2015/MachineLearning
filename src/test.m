clear
clc

imFile = strcat('ICE/', '1.bmp');
testImage = imread(imFile);
imFile = strcat('ICE/', 'ansSclera1.bmp');
scleraImage = imread(imFile);
imFile = strcat('ICE/', 'ansIris1.bmp');
irisImage = imread(imFile);

