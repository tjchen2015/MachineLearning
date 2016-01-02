featureSet = [];
answer = [];
for i = 1:40
    filename = ['../feature/ICE/iris/iris' num2str(i)];
    feature = load(filename);
    feature = feature.generatedIrisFeatureSet;
    featureSet = [featureSet feature];

    answerIrisImage = imread(sprintf('../answer/ICE/ansIris%d.bmp', i));
    [r, c] = size(answerIrisImage);
    answer = [answer reshape(im2double(answerIrisImage).', 1, r*c)];
end

net = feedforwardnet([16 24], 'traincgf');

for j = 1:10
    net = train(net, featureSet, answer, 'reduction', 10);
    
    filename = ['../output/neural network/ICE/iris/2Layer_40Image_ConcatMatrix_train' num2str(j)];
    save(filename, 'net');
end



