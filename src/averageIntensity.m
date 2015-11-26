function u = averageIntensity(II, x1, y1, x2, y2)
%input: integral image II, rectangular region
    %upper-left (x 1, y1) bottom-right (x2, y2)
%output: average intensity u within rectangular region

[height, width] = size(II);

%check index out of bound
if x1 < 1
    x1 = 1;
end
if y1 < 1
    y1 = 1;
end

if x2 > width
    x2 = width;
end
if y2 > height
    y2 = height;
end

%assign values
if x1==1 && y1==1
    A = 0;
    B = 0;
    C = 0;
elseif x1 == 1
    A = 0;
    B = II(y1-1, x2);
    C = 0;
elseif y1 == 1
    A = 0;
    B = 0;
    C = II(y2, x1-1);
else
    A = II(y1-1, x1-1);
    B = II(y1-1, x2);
    C = II(y2, x1-1);
end

T = (x2-x1+1) * (y2-y1+1);%number of pixels within rectangular region
u = (II(y2, x2) + A - B - C) / T;
