function II = integralImage(I)
%input: image I
%output: integral image II

[height, width] = size(I);

s = [];
II = [];

for x = 1:width
    for y = 1:height
        if y == 1
            s(y, x) = 0 + I(y, x);%s(x, 0) = 0
        else
            s(y, x) = s(y-1, x) + I(y, x);
        end
        
        if x == 1
            II(y, x) = 0 + s(y, x);%II(0, y) = 0
        else
            II(y, x) = II(y, x-1) + s(y, x);
        end
    end
end
