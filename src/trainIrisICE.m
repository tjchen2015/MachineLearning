net1 = feedforwardnet([16 24], 'traincgf');
for j = 1:10
    j
    for i = 1:40
        i
        filename = ['../feature/ICE/iris/iris' num2str(i)];
        feature = load(filename);
        feature = feature.generatedIrisFeatureSet;

        irisImage = imread(sprintf('../answer/ICE/ansIris%d.bmp', i));
        [r, c] = size(irisImage);
        answer = reshape(im2double(irisImage).', 1, r*c);
        if i==1 && j==1
            net = train(net1, feature, answer);
        else
            net = train(net, feature, answer);
        end
    end
    filename = ['../output/neural network/ICE/iris/2Layer_40Image_train' num2str(j)];
    save(filename, 'net');
end
