function II = integralImage(I)
%input: image I
%output: integral image II

[height, width] = size(I);

s = [];
II = [];

for x = 1:height
    for y = 1:width
        if y == 1
            s(x, 1) = 0 + I(x, y);%s(x, 0) = 0
        else
            s(x, y) = s(x, y-1) + I(x, y);
        end
        
        if x == 1
            II(1, y) = 0 + s(x, y);%II(0, y) = 0
        else
            II(x, y) = II(x-1, y) + s(x, y);
        end
    end
end
