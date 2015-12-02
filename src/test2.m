clear
clc


scleraFeature = [];%sclera feature sets of each image in matrix form
scleraAnswer = [];%expected result of neural network
r = 480;
c = 640;
net = feedforwardnet([12, 12*1.5], 'traincgf');

%train 1 ~ 7
for n = 1:7
    n
    filename = ['./scleraFeatureSet/scNew', int2str(n)];
    feature = load(filename);
    feature = feature.scFeatureSet;
    scleraFeature = horzcat(scleraFeature, feature);

    filename = ['C:\Users\Justin\Dropbox\Data Science\MachineLearning\NCU course\ICE\answer\ansSclera', int2str(n), '.bmp'];
    scleraImage = imread(filename);
    scleraImage = double(scleraImage) / 255;
    scleraImage = reshape(scleraImage.', 1, r*c);
    scleraAnswer = horzcat(scleraAnswer, scleraImage);
    
    net = train(net, scleraFeature, scleraAnswer);
    
end


%test 8
for b = 8:10
    filename =[ './scleraFeatureSet/scNew', int2str(n)];
    feature = load(filename);
    feature = feature.scFeatureSet;
    
    a = net(feature);
    a = reshape(a, c, r);
    a = a';
    
    imagesc(a);
    colormap gray;
end
        


