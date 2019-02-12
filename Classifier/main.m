benign = {'0000000', '0000001', '0000003', '0000006', '0000007', '0000008', ...
    '0000009', '0000011', '0000012', '0000014'};
malign = {'0000002', '0000013', '0000029', '0000030', '0000031', '0000049', ...
    '0000070', '0000078', '0000141', '0000142'};

folder = 'C:\Users\raulmacintosh\Documents\Projeto\Results\';

nonMelanomaCentroidAsymmetry = 0;
nonMelanomaCentroidBorder = 0;
nonMelanomaCentroidDiameter = 0;

melanomaCentroidAsymmetry = 0;
melanomaCentroidBorder = 0;
melanomaCentroidDiameter = 0;

for i = 1:10
    fileName = ['characteristics/ISIC_' char(benign(i)) '.txt'];
    
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

        newDataName = [folder 'ISIC_' char(benign(i)) '.txt'];
        resultFile = fopen(newDataName, 'w');

        fprintf(resultFile, 'Benígno\n');
        fclose(resultFile);
    end
end

for i = 1:10
    fileName = ['characteristics/ISIC_' char(malign(i)) '.txt'];
    
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

        newDataName = [folder 'ISIC_' char(malign(i)) '.txt'];
        resultFile = fopen(newDataName, 'w');

        fprintf(resultFile, 'Malígno\n');
        fclose(resultFile);
    end
end

for i = 0:9
    if (ismember(['000000' int2str(i)], benign) == 0) && (ismember(['000000' int2str(i)], malign) == 0)
        fileName = ['characteristics/ISIC_000000' int2str(i) '.txt'];

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
                newDataName = [folder 'ISIC_000000' int2str(i) '.txt'];
                resultFile = fopen(newDataName, 'w');
                fprintf(resultFile, 'Malígno\n');
                fclose(resultFile);

                melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/2;
                melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/2;
                melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/2;
            else
                newDataName = [folder 'ISIC_000000' int2str(i) '.txt'];
                resultFile = fopen(newDataName, 'w');
                fprintf(resultFile, 'Benígno\n');
                fclose(resultFile);

                nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/2;
                nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/2;
                nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/2;
            end
        end
    end
end

for i = 10:99
    fileName = ['characteristics/ISIC_00000' int2str(i) '.txt'];
    
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
            newDataName = [folder 'ISIC_00000' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Malígno\n');
            fclose(resultFile);

            melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/2;
            melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/2;
            melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/2;
        else
            newDataName = [folder 'ISIC_00000' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Benígno\n');
            fclose(resultFile);

            nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/2;
            nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/2;
            nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/2;
        end
    end
end

for i = 100:175
    fileName = ['characteristics/ISIC_0000' int2str(i) '.txt'];
    
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
            newDataName = [folder 'ISIC_0000' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Malígno\n');
            fclose(resultFile);

            melanomaCentroidAsymmetry = (melanomaCentroidAsymmetry + asymmetry)/2;
            melanomaCentroidBorder = (melanomaCentroidBorder + regularBorder)/2;
            melanomaCentroidDiameter = (melanomaCentroidDiameter + diameter)/2;
        else
            newDataName = [folder 'ISIC_0000' int2str(i) '.txt'];
            resultFile = fopen(newDataName, 'w');
            fprintf(resultFile, 'Benígno\n');
            fclose(resultFile);

            nonMelanomaCentroidAsymmetry = (nonMelanomaCentroidAsymmetry + asymmetry)/2;
            nonMelanomaCentroidBorder = (nonMelanomaCentroidBorder + regularBorder)/2;
            nonMelanomaCentroidDiameter = (nonMelanomaCentroidDiameter + diameter)/2;
        end
    end
end