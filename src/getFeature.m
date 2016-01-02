function feature = getFeature( testImage, class, si )
%GETFEATURE get the feature set of the testimage by ICE/UBIRIS and
%sclera/iris
%   testimage is the source eye image, all its pixel value is 0 to 1
%   class is a string either 'ICE' or 'UBIRIS'
%   si decides which feature to choose, 'sclera' or 'iris'

isICE = strcmp(class, 'ICE');
isSclera = strcmp(si, 'sclera');
if isICE
    if isSclera
        feature = scleraFeatureSet(testImage);
    else
        feature = irisFeatureSet(testimage)
    end
else
    if isSclera
        feature = scleraFeatureUBIRIS(testimage);
    else
        feature = irisFeatureUBIRIS(testimage);
    end
end
    

end

