function u = averageIntensity(II, x1, y1, x2, y2, usage)
%input: integral image II
%output: average intensity u within rectangular region
    %upper-left (x1, y1) bottom-right (x2, y2)

if usage == 1
    T = (x2-x1+1) * (y2-y1+1);%number of pixels within rectangular region

    u = (II(x2, y2) + II(x1, y1) - II(x2, y1) - II(x1, y2)) / T;
else usage == 2 %used when calculating proportion of sclera
    T = 0;
    for x = x1:x2
        for y = y1:y2
            if sclera(x, y) == 0
                T = T + 1;
            end
        end
    end
    %??????????????????
end