function adjustedImage = modifyEdge(I, r)
    [height width] = size(I);
    blockSize = (r*2+1)^2;
    % Top green
    for y = 1 : r
        for x = r+1 : width-r
            white = (r*2+1) * (r-y+1);
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    % Bottom green
    for y = (height-r+1) : height
        for x = (r+1) : (width-r)
            white = (r*2+1) * (y-(height-r));
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    %Left green
    for x = 1 : r
        for y = (r+1) : (height-r)
            white = (r*2+1) * (r-x+1);
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    % Right green
    for x = (width-r+1) : width
        for y = (r+1) : (height-r)
            white = (r*2+1) * (x-(width-r));
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    % Top-Right blue
    for y = 1 : r
        for x = (width-r+1) : width
            white = (r*2+1) * (r-y+1) + (r+y) * (x-(width-r));
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    % Bottom-Right blue
    for y = (height-r+1) : height
        for x = (width-r+1) : width
            white = (r*2+1) * (r-(height-y)) + (height-y+1+r) * (x-(width-r));
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    % Top-Left blue
    for y = 1 : r
        for x = 1 : r
            white = (r*2+1) * (r-y+1) + (r+y) * (r+1-x);
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    
    % Bottom-Left blue
    for y = (height-r+1) : height
        for x = 1 : r
            white = (r*2+1) * (r-(height-y)) + (height-y+1+r) * (r+1-x);
            coff = blockSize / (blockSize - white);
            I(y, x) = I(y, x) * coff;
        end
    end
    adjustedImage = I;
end