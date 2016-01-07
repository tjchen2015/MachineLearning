import Testing.*;

nnPath = '../output/neural network/UBIRIS/sclera/UBIRIS_2Layer_53Image_ConcatMatrix_train1.mat';
threshold = 0.4;

for i = [1 10 11 12 13 14 15 16 17 18 19 20 21 23 24 25 27 29 30 31 32 33 34 35 36 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67]
    imgPath = sprintf('../databases/UBIRIS/%d.bmp', i);
    outImg = sclera(nnPath, imgPath, 3);
    
    filename = ['../output/image/UBIRIS/sclera/sclera' num2str(i) '.bmp'];
    imwrite(outImg, filename);
    
    outImgBW = im2bw(outImg, threshold);
    filename = ['../output/image/UBIRIS/sclera/scleraBW' num2str(i) '.bmp'];
    imwrite(outImgBW, filename);
end
