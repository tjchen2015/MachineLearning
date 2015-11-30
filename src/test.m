%%%training test
scleraFeature = [];%sclera feature sets of each image in matrix form
scleraAnswer = [];%expected result of neural network
% for i = 1:100
%     filename = ['D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc' num2str(i)];
%     feature = load(filename);
%     feature = feature.scFeatureSet;%feature = cell array
%     [r, c] = size(feature);
%     for j = 1:r
%         for k = 1:c
%             scleraFeature = horzcat(scleraFeature, feature{j, k}');%cell array to matrix
%         end
%     end
%     
%     scleraImage = imread(sprintf('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera%d.bmp', i));
%     [r, c] = size(scleraImage);
%     scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));
% end

%==========================================================================
filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc1';
feature = load(filename);
feature = feature.scFeatureSet;
scleraFeature = horzcat(scleraFeature, feature);

scleraImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera1.bmp');
[r, c] = size(scleraImage);
scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));

filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc50';
feature = load(filename);
feature = feature.scFeatureSet;
scleraFeature = horzcat(scleraFeature, feature);

scleraImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera50.bmp');
% [r, c] = size(scleraImage);
scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));

filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc113';
feature = load(filename);
feature = feature.scFeatureSet;
scleraFeature = horzcat(scleraFeature, feature);

scleraImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera113.bmp');
% [r, c] = size(scleraImage);
scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));

filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc222';
feature = load(filename);
feature = feature.scFeatureSet;
scleraFeature = horzcat(scleraFeature, feature);

scleraImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera222.bmp');
% [r, c] = size(scleraImage);
scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));

filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc340';
feature = load(filename);
feature = feature.scFeatureSet;
scleraFeature = horzcat(scleraFeature, feature);

scleraImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera340.bmp');
% [r, c] = size(scleraImage);
scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));

filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\feature sets\ICE\sc465';
feature = load(filename);
feature = feature.scFeatureSet;
scleraFeature = horzcat(scleraFeature, feature);

scleraImage = imread('D:\HomeworkWorkspace\Machine Learning\Final project\databases\answer\ansSclera465.bmp');
% [r, c] = size(scleraImage);
scleraAnswer = horzcat(scleraAnswer, reshape(scleraImage, 1, r*c));
%==========================================================================

net = feedforwardnet(12);
for i = 1:100
    i
%     net.efficiency.memoryReduction = 1;
    net = train(net, scleraFeature, scleraAnswer);
end
filename = 'D:\HomeworkWorkspace\Machine Learning\Final project\data\neural network\nn5Ans';
save(filename, 'net');

a = net(scleraFeature);
a = reshape(a, r, c);
imagesc(a);
colormap gray;

% testImage = imread(sprintf('D:\\HomeworkWorkspace\\Machine Learning\\Final project\\databases\\ICE\\%d.bmp', i));
% imFile = strcat('ICE/', 'ansIris1.bmp');
% irisImage = imread(imFile);

%==========================================================================
testFeatureSet();
