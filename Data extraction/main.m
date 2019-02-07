for i = 2:9
    fileName = ['images/IMD00' int2str(i) '.bmp'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        [border, diameter, asymmetry] = extraction(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\characteristics\';
        newDataName = [folder 'IMD00' int2str(i) '.txt'];
        fileID = fopen(newDataName, 'w');
        fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
        fclose(fileID);
    end
end

for i = 10:99
    fileName = ['images/IMD0' int2str(i) '.bmp'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        [border, diameter, asymmetry] = extraction(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\characteristics\';
        newDataName = [folder 'IMD0' int2str(i) '.txt'];
        fileID = fopen(newDataName, 'w');
        fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
        fclose(fileID);
    end
end

for i = 100:437
    fileName = ['images/IMD' int2str(i) '.bmp'];
    
    if exist(fileName, 'file') == 2
        img = imread(fileName);

        [border, diameter, asymmetry] = extraction(img);

        folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\characteristics\';
        newDataName = [folder 'IMD' int2str(i) '.txt'];
        fileID = fopen(newDataName, 'w');
        fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
        fclose(fileID);
    end
end