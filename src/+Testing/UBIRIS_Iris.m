import Core.*;

net = load('../output/neural network/UBIRIS/iris/2Layer_53Image_train10');
net = net.net;

for imageID=[1 10 11 12 13 14 15 16 17 18 19 20]
%     imageID = 140;
    testImageFile = sprintf('../answer/UBIRIS/%d/img.jpg', imageID);
    testImage = imread(testImageFile);
    testImage = im2double(testImage);
    detectedScleraFile = sprintf('../answer/UBIRIS/%d/sclera_mask.bmp', imageID);
    detectedSclera = imread(detectedScleraFile);
    detectedSclera = im2double(detectedSclera);

    irisFeatureSet = irisFeatureSet(testImage, detectedSclera);

    output = net(irisFeatureSet);
    output1 = reshape(output, 800, 600).';
    % output2 = im2bw(output, 0.7);%binarization
    % output2 = reshape(output2, 800, 600).';
    imagesc(output1);
    colormap gray;

    filename1 = ['../output/image/UBIRIS/iris' num2str(imageID) '.bmp'];
    imwrite(output1, filename1);
end