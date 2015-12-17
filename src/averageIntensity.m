function u = averageIntensity(subImage)
%input: integral image II, rectangular region
    %upper-left (x 1, y1) bottom-right (x2, y2)
%output: average intensity u within rectangular region

u = sum(subImage) / numel(subImage);
