function [ output ] = preProcessing( input )
    imgGray = rgb2gray(input);
    r = imadjust(input(:, :, 1));
    g = imadjust(input(:, :, 2));
    b = imadjust(input(:, :, 3));
    
    filter = ones(7, 7)/49;
    mask = masker(r);
    se = strel('cube',3);
    
    imgGray = imadjust(imfilter(imgGray, filter));
        
    threshold = graythresh(imgGray);
    
    binImg = uint8(imbinarize(imgGray, threshold) * 255) + mask;
    
    binImg = imcomplement(binImg);
    
    binImg = imerode(binImg, se);
    binImg = imerode(binImg, se);
    binImg = imerode(binImg, se);
    binImg = imopen(binImg, se);
    binImg = imfill(binImg, 'holes');
    
    binImg = imcomplement(binImg);
    
    tumorR = r - (binImg);
    tumorG = g - (binImg);
    tumorB = b - (binImg);
    
    output = cat(3, tumorR, tumorG, tumorB);
end
