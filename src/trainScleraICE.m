net1 = feedforwardnet([12 18], 'traincgf');
for j = 1:10
    j
    for i = 1:40
        i
        filename = ['../feature/ICE/sclera/sclera' num2str(i)];
        feature = load(filename);
        feature = feature.scFeatureSet;

        scleraImage = imread(sprintf('../answer/ICE/ansSclera%d.bmp', i));
        [r, c] = size(scleraImage);
        answer = reshape(im2double(scleraImage).', 1, r*c);
        if i==1 && j==1
            net = train(net1, feature, answer);
        else
            net = train(net, feature, answer);
        end
    end
    filename = ['../output/neural network/ICE/2Layer_40Image_train' num2str(j)];
    save(filename, 'net');
end
