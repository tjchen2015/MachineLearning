clear
clc

% load('f.mat');
% load('net.mat');
% 
% ans = net(f);
% ans = reshape(ans, 480, 640);

load('a1000.mat');
figure;
imagesc(a);
colormap gray;

load('a10.mat');
figure;
imagesc(a);
colormap gray;

% imFile = strcat('ICE/', 'ansSclera1.bmp');
% scleraImage = imread(imFile);
% figure;
% imshow(scleraImage);
