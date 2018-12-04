function [ output ] = getDiameter( img )
    N = size(img, 1);
    M = size(img, 2);
    
    upperX = 0;
    upperY = 0;
    lowerX = 0;
    lowerY = 0;
    
    upperFlag = false;
    for i = 1:N
        for j = 1:M
            if ((img(i, j) > 0) && (upperFlag == false))
                upperX = j;
                upperY = i;
                upperFlag = true;
            end

            if ((upperFlag == true))
                if (img(i, j) > 0)
                    lowerX = j;
                    lowerY = i;
                end
            end
        end
    end

    leftX = 0;
    leftY = 0;
    rightX = 0;
    rightY = 0;
    
    leftFlag = false;
    for i = 1:M
        for j = 1:N
            if ((img(j, i) > 0) && (leftFlag == false))
                leftX = i;
                leftY = j;
                leftFlag = true;
            end

            if ((leftFlag == true))
                if (img(j, i) > 0)
                    rightX = i;
                    rightY = j;
                end
            end
        end
    end
    
    distanceVertical = sqrt((upperX - lowerX).^2 + (upperY - lowerY).^2);
    distanceHorizontal = sqrt((leftX - rightX).^2 + (leftY - rightY).^2);
    
    if (distanceVertical > distanceHorizontal)
        output = distanceVertical;
    else
        output = distanceHorizontal;
    end
end