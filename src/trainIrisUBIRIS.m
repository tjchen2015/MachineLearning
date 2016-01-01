net1 = feedforwardnet([18 27], 'traincgf');
for j = 1:10
    j
    for i = [1 10 11 12 13 14 15 16 17 18 19 20 21 23 24 25 27 29 30 31 32 33 34 35 36 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67]
        i
        filename = ['../feature/UBIRIS/iris/iris' num2str(i)];
        feature = load(filename);
        feature = feature.generatedIrisFeatureSet;

        irisImage = imread(sprintf('../answer/UBIRIS/%d/iris_mask.bmp', i));
        [r, c] = size(irisImage);
        answer = reshape(im2double(irisImage).', 1, r*c);
        if i==1 && j==1
            net = train(net1, feature, answer);
        else
            net = train(net, feature, answer);
        end
    end
    filename = ['../output/neural network/UBIRIS/iris/2Layer_53Image_train' num2str(j)];
    save(filename, 'net');
end
