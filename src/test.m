clear
clc

imFile = strcat('ICE/', '1.bmp');
testImage = imread(imFile);
imFile = strcat('ICE/', 'ansSclera1.bmp');
scleraImage = imread(imFile);
% imFile = strcat('ICE/', 'ansIris1.bmp');
% irisImage = imread(imFile);
% 
% testImage = double(testImage);
% featureSet = scleraFeatureSet(testImage, 1);

f = ones(1,12);
for n = 1:480
    for m = 1:640
        tmp = featureSet{n,m};
        f = [f; tmp];
    end
end

load('f.mat');

f = f';
f = f(: , 2:480*640+1);

net = feedforwardnet(18);
reScleraImage = reshape(scleraImage, 1, 307200);

for i = 1:1000
    i
    net = train(net, f, reScleraImage);
end

a = net(f);
a = reshape(a, 480, 640);
imagesc(a);
colormap gray;




