function u = averageIntensity(II, x1, y1, x2, y2)
%input: integral image II, rectangular region
    %upper-left (x 1, y1) bottom-right (x2, y2)
%output: average intensity u within rectangular region

[height, width] = size(II);

T = (x2-x1+1) * (y2-y1+1);%number of pixels within rectangular region

if x1 < 1
    x1 = 1;
end
if x2 > width
    x2 = width;
end

if y1 < 1
    y1 = 1;
end
if y2 > height
    y2 = height;
end

A = II(x1, y1);
B = II(x2, y1);
C = II(x1, y2);

u = (II(x2, y2) + A - B - C) / T;
