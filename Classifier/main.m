benign = {'004', '017', '024', '038', '142', '177', '207', '208', '395', '427'};
malign = {'014', '031', '032', '058', '064', '076', '085', '408', '417', '435'};

folder = 'C:\Users\raulmacintosh\Documents\Projeto\Results\';

nonMelanomaCentroidAsymmetry = 0;
nonMelanomaCentroidBorder = 0;
nonMelanomaCentroidDiameter = 0;

melanomaCentroidAsymmetry = 0;
melanomaCentroidBorder = 0;
melanomaCentroidDiameter = 0;

for i = 1:10
    fileName = ['characteristics/IMD' char(benign(i)) '.txt'];
    
    if exist(fileName, 'file') == 2
        fileID = fopen(fileName);
        values = textscan(fileID,'%10.2f %10.2f %10.2f');
        fclose(fileID);

        border = values{1};
        diameter = values{2};
        asymmetry = values{3};

        regularBorder = uint8(abs(border - (diameter * pi)));

        nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/i;
        nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/i;
        nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/i;

        newDataName = [folder 'IMD' char(benign(i)) '.txt'];
        resultFile = fopen(newDataName, 'w');

        fprintf(resultFile, 'Benígno\n');
        fclose(resultFile);
    end
end

for i = 1:10
    fileName = ['characteristics/IMD' char(malign(i)) '.txt'];
    
    if exist(fileName, 'file') == 2
        fileID = fopen(fileName);
        values = textscan(fileID,'%10.2f %10.2f %10.2f');
        fclose(fileID);

        border = values{1};
        diameter = values{2};
        asymmetry = values{3};

        regularBorder = uint8(abs(border - (diameter * pi)));

        melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/i;
        melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/i;
        melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/i;

        newDataName = [folder 'IMD' char(malign(i)) '.txt'];
        resultFile = fopen(newDataName, 'w');

        fprintf(resultFile, 'Malígno\n');
        fclose(resultFile);
    end
end

for i = 2:9
    fileName = ['characteristics/IMD00' int2str(i) '.txt'];
    
    if exist(fileName, 'file') == 2
        fileID = fopen(fileName);
        values = textscan(fileID, '%10.2f %10.2f %10.2f');
        fclose(fileID);

        border = values{1};
        diameter = values{2};
        asymmetry = values{3};

        regularBorder = uint8(abs(border - (diameter * pi)));

        nonMelanomaDistance = sqrt(double((nonMelanomaCentroidAsymmetry - asymmetry).^2 + ...
            (nonMelanomaCentroidBorder - regularBorder).^2 + ...
            (nonMelanomaCentroidDiameter - diameter).^2));

        melanomaDistance = sqrt(double((melanomaCentroidAsymmetry - asymmetry).^2 + ...
            (melanomaCentroidBorder - regularBorder).^2 + ...
            (melanomaCentroidDiameter - diameter).^2));

        if (nonMelanomaDistance >= melanomaDistance)
            newDataName = [folder 'IMD00' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Malígno\n');
            fclose(resultFile);

            melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/2;
            melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/2;
            melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/2;
        else
            newDataName = [folder 'IMD00' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Benígno\n');
            fclose(resultFile);

            nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/2;
            nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/2;
            nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/2;
        end
    end
end

for i = 10:99
    fileName = ['characteristics/IMD0' int2str(i) '.txt'];
    
    if exist(fileName, 'file') == 2
        fileID = fopen(fileName);
        values = textscan(fileID,'%10.2f %10.2f %10.2f');
        fclose(fileID);

        border = values{1};
        diameter = values{2};
        asymmetry = values{3};

        regularBorder = uint8(abs(border - (diameter * pi)));

        nonMelanomaDistance = sqrt(double((nonMelanomaCentroidAsymmetry - asymmetry).^2 + ...
            (nonMelanomaCentroidBorder - regularBorder).^2 + ...
            (nonMelanomaCentroidDiameter - diameter).^2));

        melanomaDistance = sqrt(double((melanomaCentroidAsymmetry - asymmetry).^2 + ...
            (melanomaCentroidBorder - regularBorder).^2 + ...
            (melanomaCentroidDiameter - diameter).^2));

        if (nonMelanomaDistance > melanomaDistance)
            newDataName = [folder 'IMD0' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Malígno\n');
            fclose(resultFile);

            melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/2;
            melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/2;
            melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/2;
        else
            newDataName = [folder 'IMD0' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Benígno\n');
            fclose(resultFile);

            nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/2;
            nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/2;
            nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/2;
        end
    end
end

for i = 100:437
    fileName = ['characteristics/IMD' int2str(i) '.txt'];
    
    if exist(fileName, 'file') == 2
        fileID = fopen(fileName);
        values = textscan(fileID,'%10.2f %10.2f %10.2f');
        fclose(fileID);

        border = values{1};
        diameter = values{2};
        asymmetry = values{3};

        regularBorder = uint8(abs(border - (diameter * pi)));

        nonMelanomaDistance = sqrt(double((nonMelanomaCentroidAsymmetry - asymmetry).^2 + ...
            (nonMelanomaCentroidBorder - regularBorder).^2 + ...
            (nonMelanomaCentroidDiameter - diameter).^2));

        melanomaDistance = sqrt(double((melanomaCentroidAsymmetry - asymmetry).^2 + ...
            (melanomaCentroidBorder - regularBorder).^2 + ...
            (melanomaCentroidDiameter - diameter).^2));

        if (nonMelanomaDistance >= melanomaDistance)
            newDataName = [folder 'IMD' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Malígno\n');
            fclose(resultFile);

            melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/2;
            melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/2;
            melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/2;
        else
            newDataName = [folder 'IMD' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Benígno\n');
            fclose(resultFile);

            nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/2;
            nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/2;
            nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/2;
        end
    end
end