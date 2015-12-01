%%%old feature, 0 1 scAnswer, new network
net1 = feedforwardnet([12, 12*1.5], 'traincgf');
for j = 1:10
    j
    for i = 1:10
        i
        filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc' num2str(i)];
        feature = load(filename);
        feature = feature.scFeatureSet;

        scleraImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\answer\\ansSclera%d.bmp', i));
        [r, c] = size(scleraImage);
        scleraImage = double(scleraImage) / 255;
        answer = reshape(scleraImage.', 1, r*c);
        if i==1 && j==1
            net = train(net1, feature, answer);
        else
            net = train(net, feature, answer);
        end
    end
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\neural network\nnNew_10NewAns_train' num2str(j)];
    save(filename, 'net');
end
a = net(feature);
a = reshape(a, c, r).';
imagesc(a);
colormap gray;