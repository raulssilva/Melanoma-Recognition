for i = 2:9
    fileName = ['../Dataset/IMD00' int2str(i) '.bmp'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        tumor = preProcessing(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\images\';
        newimagename = [folder 'IMD00' int2str(i) '.bmp'];
        imwrite(tumor, newimagename);
    end
end

for i = 10:99
    fileName = ['../Dataset/IMD0' int2str(i) '.bmp'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        tumor = preProcessing(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\images\';
        newimagename = [folder 'IMD0' int2str(i) '.bmp'];
        imwrite(tumor, newimagename);
    end
end

for i = 100:437
    fileName = ['../Dataset/IMD' int2str(i) '.bmp'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        tumor = preProcessing(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\images\';
        newimagename = [folder 'IMD' int2str(i) '.bmp'];
        imwrite(tumor, newimagename);
    end
end