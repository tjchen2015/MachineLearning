function distance = disCenter( irisImage, centerPos, io )
%disCenter gets an inner-iris-border-distance vector
% or an outer-iris-border-distance vector with respect to the 
% center position from 0 to 2 pi.
%   distance is 180-length vector
%   irisImage - the source binary image
%   centerPos - the center position
%   io - 1 means to get inner border and 2 means to get outer border

distance = [];
imageSize = size(irisImage);
rMax = sqrt(imageSize(1)^2 + imageSize(2)^2)/2;
rMax = round(rMax);
rMax

for i = 1:180
    c = cos(i*2*pi/180);
    s = sin(i*2*pi/180);
    black = 0;
    
    for r = 1:rMax
        % n for row, m for column
        n = centerPos(1) + round(r*s);
        m = centerPos(2)+ round(r*c);
        
        %check if (n ,m) is in image
        if (0 < n)&&(n <= imageSize(1))&&(0 < m)&&(m <= imageSize(2))
            
            % evaluate distance of inner border
            if io == 1
                if irisImage(n,m) == 0
                    distance(i) = r;
                    break;
                end
            end
            
            % evaluate distance of outer border
            if io == 2
                if irisImage(n,m) == 0
                    black = 1;
                end
                if (irisImage(n,m) == 255) && (black == 1)
                    distance(i) = r;
                    break;
                end
            end
            
        else
            
        end
        
        
        
    end
    
end

