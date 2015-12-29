%%%ICE
net1 = feedforwardnet(12, 'traincgf');%[12, 12*1.5]
for j = 1:10
    j
    for i = 1:30
        i
        filename = ['../feature/ICE/sc' num2str(i)];
        feature = load(filename);
        feature = feature.scFeatureSet;

        scleraImage = imread(sprintf('../databases/answer/ansSclera%d.bmp', i));
        [r, c] = size(scleraImage);
        answer = reshape(im2double(scleraImage).', 1, r*c);
        if i==1 && j==1
            net = train(net1, feature, answer);
        else
            net = train(net, feature, answer);
        end
    end
    filename = ['../output/neural network/ICE/1Layer_30Image_train' num2str(j)];
    save(filename, 'net');
end

% net = load('../output/neural network/ICE/nnNew_10NewAns_train10');
% net = net.net;
% for i=1:10
% filename = ['../feature/ICE/scNew' num2str(11)];
% feature = load(filename);
% feature = feature.scFeatureSet;
% output = net(feature);
% output1 = reshape(output, 640, 480).';
% output2 = im2bw(output, 0.7);%binarization
% output2 = reshape(output2, 640, 480).';
% imagesc(output);
% colormap gray;

% filename1 = ['../output/result image/ICE/sc' num2str(11) '.bmp'];
% imwrite(output1, filename1);
% filename2 = ['../output/result image/ICE/sc' num2str(11) '.bmp'];
% imwrite(output2, filename2);
% end