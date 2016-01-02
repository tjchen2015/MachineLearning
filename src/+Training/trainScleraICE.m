import Core.*;

featureSet = [];
answer = [];
for i = 1:40
    filename = ['../feature/ICE/sclera/sclera' num2str(i)];
    feature = load(filename);
    feature = feature.scFeatureSet;
    featureSet = [featureSet feature];

    scleraImage = imread(sprintf('../answer/ICE/ansSclera%d.bmp', i));
    [r, c] = size(scleraImage);
    answer = [answer reshape(im2double(scleraImage).', 1, r*c)];
end

net = feedforwardnet([12 18], 'traincgf');

for j = 1:10
    net = train(net, featureSet, answer);
    
    filename = ['../output/neural network/ICE/2Layer_40Image_ConcatMatrix_train' num2str(j)];
    save(filename, 'net');
end
