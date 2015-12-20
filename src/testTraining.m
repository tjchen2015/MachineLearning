%%%ICE
net1 = feedforwardnet(12, 'traincgf');%[12, 12*1.5]
for j = 1:10
    j
    for i = 1:30
        i
        filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc' num2str(i)];
        feature = load(filename);
        feature = feature.scFeatureSet;

        scleraImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\answer\\ansSclera%d.bmp', i));
        [r, c] = size(scleraImage);
        scleraImage = double(scleraImage) / 255;%set sclerImage from 0~255 to 0~1
        answer = reshape(scleraImage.', 1, r*c);
        if i==1 && j==1
            net = train(net1, feature, answer);
        else
            net = train(net, feature, answer);
        end
    end
    filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\neural network\ICE\1Layer_30Image_train' num2str(j)];
    save(filename, 'net');
end

% net = load('D:\HomeworkWorkspace\Machine Learning\Final project\data\neural network\ICE\nnNew_10NewAns_train10');
% net = net.net;
% for i=1:10
% filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\scNew' num2str(11)];
% feature = load(filename);
% feature = feature.scFeatureSet;
% output = net(feature);
% output1 = reshape(output, 640, 480).';
% output2 = im2bw(output, 0.7);%binarization
% output2 = reshape(output2, 640, 480).';
% imagesc(output);
% colormap gray;

% filename1 = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\result image\ICE\sc' num2str(11) '.bmp'];
% imwrite(output1, filename1);
% filename2 = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\result image\ICE\sc' num2str(11) '.bmp'];
% imwrite(output2, filename2);
% end