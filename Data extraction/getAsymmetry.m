function [ output ] = getAsymmetry( img )
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
    
    % Ponto Médio Vertical
    vertXM = uint16((upperX + lowerX)/2);
    vertYM = uint16((upperY + lowerY)/2);

    % Ponto Médio Horizontal
    horXM = uint16((leftX + rightX)/2);
    horYM = uint16((leftY + rightY)/2);


    % Centro
    centerX = uint16((vertXM + horXM)/2);
    centerY = uint16((vertYM + horYM)/2);
    
    binImg = im2bw(img, 0);
    areaLeft = 0;
    areaRight = 0;
    for i = 1:N
        for j = 1:M
            if (j < centerY)
                areaLeft = areaLeft + binImg(i, j);
            else
                areaRight = areaRight + binImg(i, j);
            end
        end
    end
    
    areaUp = 0;
    areaDown = 0;
    for i = 1:N
        for j = 1:M
            if (i < centerX)
                areaUp = areaUp + binImg(i, j);
            else
                areaDown = areaDown + binImg(i, j);
            end
        end
    end
    
    output = abs(areaUp - areaDown);
    
end