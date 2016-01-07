import Core.*;

for i = [1 10 11 12 13 14 15 16 17 18 19 20 21 23 24 25 27 29 30 31 32 33 34 35 36 38 39 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 65 66 67]
    testImage = imread(sprintf('../answer/UBIRIS/%d/img.jpg', i));
    testImage = im2double(testImage);
    
    detectedSclera = imread(sprintf('../answer/UBIRIS/%d/sclera_mask.bmp', i));
    generatedIrisFeatureSet = irisFeatureSet(testImage, im2double(detectedSclera));
    
    filename = ['../feature/UBIRIS/iris/iris' num2str(i)];
    save(filename, 'generatedIrisFeatureSet');
end
