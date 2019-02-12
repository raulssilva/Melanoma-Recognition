for i = 0:9
    fileName = ['../ISIC-images/UDA-1/ISIC_000000' int2str(i) '.jpg'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        tumor = preProcessing(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\images\';
        newimagename = [folder 'ISIC_000000' int2str(i) '.jpg'];
        imwrite(tumor, newimagename);
    end
end

for i = 10:99
    fileName = ['../ISIC-images/UDA-1/ISIC_00000' int2str(i) '.jpg'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        tumor = preProcessing(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\images\';
        newimagename = [folder 'ISIC_00000' int2str(i) '.jpg'];
        imwrite(tumor, newimagename);
    end
end

for i = 100:175
    fileName = ['../ISIC-images/UDA-1/ISIC_0000' int2str(i) '.jpg'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        tumor = preProcessing(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\images\';
        newimagename = [folder 'ISIC_0000' int2str(i) '.jpg'];
        imwrite(tumor, newimagename);
    end
end