fileName = 'IMD008.txt';
fileID = fopen(fileName);
values = textscan(fileID,'%10.2f %10.2f %10.2f');
fclose(fileID);

border = values{1};
diameter = values{2};
asymmetry = values{3};

regularBorder = uint8(abs(border - (diameter * pi)));

nonMelanomaClass = regularBorder + diameter + asymmetry;

folder = 'C:\Users\raulmacintosh\Documents\Projeto\Results\';
newDataName = [folder fileName];
resultFile = fopen(newDataName, 'w');

fprintf(resultFile, 'Benígno\n');
fclose(resultFile);



fileName = 'IMD001.txt';
fileID = fopen(fileName);
values = textscan(fileID,'%10.2f %10.2f %10.2f');
fclose(fileID);

border = values{1};
diameter = values{2};
asymmetry = values{3};

regularBorder = uint8(abs(border - (diameter * pi)));

melanomaClass = regularBorder + diameter + asymmetry;

newDataName = [folder fileName];
resultFile = fopen(newDataName, 'w');

fprintf(resultFile, 'Malígno\n');
fclose(resultFile);

for i = 2:7
    fileName = ['IMD00' int2str(i) '.txt'];
	fileID = fopen(fileName);
	values = textscan(fileID,'%10.2f %10.2f %10.2f');
	fclose(fileID);

	border = values{1};
	diameter = values{2};
	asymmetry = values{3};
    
    regularBorder = uint8(abs(border - (diameter * pi)));

    tumor = regularBorder + diameter + asymmetry;
    
    if (abs(tumor - nonMelanomaClass) >= abs(tumor - melanomaClass))
        newDataName = [folder fileName];
        resultFile = fopen(newDataName, 'w');
        fprintf(resultFile, 'Malígno\n');
        fclose(resultFile);
        
        melanomaClass = (melanomaClass + tumor)/2;
    else
        newDataName = [folder fileName];
        resultFile = fopen(newDataName, 'w');
        fprintf(resultFile, 'Benígno\n');
        fclose(resultFile);
        
        nonMelanomaClass = (nonMelanomaClass + tumor)/2;
    end
end