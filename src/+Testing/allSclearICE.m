import Testing.*;

nnPath = '../output/neural network/ICE/sclera/2Layer_40Image_ConcatMatrix_train10';
threshold = 0.4;

for i = 1:40
    imgPath = sprintf('../databases/ICE/%d.bmp', i);
    outImg = sclera(nnPath, imgPath, 1);
    
    filename = ['../output/image/ICE/sclera/sclera' num2str(i) '.bmp'];
    imwrite(outImg, filename);
    
    outImgBW = im2bw(outImg, threshold);
    filename = ['../output/image/ICE/sclera/scleraBW' num2str(i) '.bmp'];
    imwrite(outImgBW, filename);
end
