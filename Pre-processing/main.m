for i = 1:8
    fileName = ['IMD00' int2str(i) '.bmp'];
    img = imread(fileName);

    tumor = preProcessing(img);

    folder = 'C:\Users\raulmacintosh\Documents\Projeto\Data extraction\';
    newimagename = [folder fileName];
    imwrite(tumor, newimagename);
end

