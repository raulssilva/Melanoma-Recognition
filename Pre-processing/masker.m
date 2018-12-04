function [ output ] = masker( input )
    N = size(input, 1);
    M = size(input, 2);
    
    output = zeros(N, M);
    
    for i = 1:N
        for j = 1:M
            distance = sqrt((i - N/2).^2 + (j - M/2).^2);
            radius = M/2 - M/16;
            if (distance > radius)
                output(i, j) = 255;
            end
        end
    end
    
    output = uint8(output);
end

