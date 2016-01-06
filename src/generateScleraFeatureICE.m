for i = 156:156
    testImage = imread(sprintf('../databases/ICE/%d.bmp', i));
    testImage = im2double(testImage);
    
    scFeatureSet = scleraFeatureSet(testImage);
    
    filename = ['../feature/ICE/sclera/sclera' num2str(i)];
    save(filename, 'scFeatureSet');
end
