for i = 0:9
    fileName = ['images/ISIC_000000' int2str(i) '.jpg'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        [border, diameter, asymmetry] = extraction(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\characteristics\';
        newDataName = [folder 'ISIC_000000' int2str(i) '.txt'];
        fileID = fopen(newDataName, 'w');
        fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
        fclose(fileID);
    end
end

for i = 10:99
    fileName = ['images/ISIC_00000' int2str(i) '.jpg'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        [border, diameter, asymmetry] = extraction(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\characteristics\';
        newDataName = [folder 'ISIC_00000' int2str(i) '.txt'];
        fileID = fopen(newDataName, 'w');
        fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
        fclose(fileID);
    end
end

for i = 100:175
    fileName = ['images/ISIC_0000' int2str(i) '.jpg'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        [border, diameter, asymmetry] = extraction(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\characteristics\';
        newDataName = [folder 'ISIC_0000' int2str(i) '.txt'];
        fileID = fopen(newDataName, 'w');
        fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
        fclose(fileID);
    end
end