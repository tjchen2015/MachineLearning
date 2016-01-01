featureSet = [];
answer = [];
for i = [1 10 11 12 13 14 15 16 17 18 19 20 21 23 24 25 27 29 30 31 32 33 34 35 36 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67]
    filename = ['../feature/UBIRIS/sclera/sclera' num2str(i)];
    feature = load(filename);
    feature = feature.scFeatureSet;
    featureSet = [featureSet feature];

    answerScleraImage = imread(sprintf('../answer/UBIRIS/%d/sclera_mask.bmp', i));
    [r, c] = size(answerScleraImage);
    answer = [answer reshape(im2double(answerScleraImage).', 1, r*c)];
end

net = feedforwardnet([20 30], 'traincgf');
net.efficiency.memoryReduction = 1;
for j = 1:10
    net = train(net, featureSet, answer);
    
    filename = ['../output/neural network/UBIRIS/sclera/2Layer_53Image_ConcatMatrix_train' num2str(j)];
    save(filename, 'net');
end
