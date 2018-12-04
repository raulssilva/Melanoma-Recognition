function [ border, diameter, asymmetry ] = extraction( input )
    imgGray = rgb2gray(input);
    
    N = size(imgGray, 1);
    M = size(imgGray, 2);
    
    r = input(:, :, 1);
    g = input(:, :, 2);
    b = input(:, :, 3);
    
    border = 0;
    perim = bwperim(im2bw(imgGray, 0), 8);
    for i = 1:N
        for j = 1:M
            if (perim(i, j) == 1)
                border = border + 1;
            end
        end
    end
    
    diameter = getDiameter(imgGray);
    
    asymmetry = getAsymmetry(imgGray);
end

