function u = averageIntensity(subImage)
%input: pixels within certain region
%output: average intensity u within the region

rowCount = size(subImage, 1);
u = sum(subImage) / rowCount;
