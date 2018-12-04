for i = 1:8
    fileName = ['IMD00' int2str(i)];
    
    img = imread([fileName '.bmp']);

    [border, diameter, asymmetry] = extraction(img);

    folder = 'C:\Users\raulmacintosh\Documents\Projeto\Classifier\';
    newDataName = [folder fileName '.txt'];
    fileID = fopen(newDataName, 'w');
    fprintf(fileID,'%10.2f %5.2f %10.2f\n', border, diameter, asymmetry);
    fclose(fileID);
end