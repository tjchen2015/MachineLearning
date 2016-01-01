net = load('../output/neural network/UBIRIS/sclera/2Layer_53Image_train10');
net = net.net;

for imageID=[1 10 11 12 13 14 15 16 17 18 19 20]
%     imageID = 140;
    filename = sprintf('../answer/UBIRIS/%d/img.jpg', imageID);
    testImage = imread(filename);
    testImage = im2double(testImage);

    scFeatureSet = scleraFeatureSet(testImage);

    output = net(scFeatureSet);
    output1 = reshape(output, 800, 600).';
    % output2 = im2bw(output, 0.7);%binarization
    % output2 = reshape(output2, 800, 600).';
    imagesc(output1);
    colormap gray;

    filename1 = ['../output/image/UBIRIS/sclera' num2str(imageID) '.bmp'];
    imwrite(output1, filename1);
end