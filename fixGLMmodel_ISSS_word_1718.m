function fixGLMmodel_ISSS_word_1718(subject)
%% Import data from text file.
% Script for importing data from the following text file:
%
%    /Users/ling-men/Documents/MRData/7T018/Ordaccent_singrun_III.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/04/19 08:16:01

for rItr = 1:2
    run=int2str(rItr);

%copyfile(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_fMRI_',run,'_first_uberultrafinal.feat/design.mat'),strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_fMRI_',run,'_first_uberultrafinal.feat/design.txt'));
copyfile(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSS_word_run',run,'.mat'),strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSS_word_run',run,'.txt'));
%copyfile(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_fMRI_',run,'_first_uberultrafinal.feat/design.con'),strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/ISSSdesign.con'));


%% Initialize variables.
filename = strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSS_word_run',run,'.txt');
delimiter = '\t';
startRow = 5;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
EV1 = dataArray{:, 1};
EV2 = dataArray{:, 2};
EV3 = dataArray{:, 3};
EV4 = dataArray{:, 4};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
EV1_new = zeros(301,1);
EV2_new = zeros(301,1);
EV3_new = zeros(301,1);
EV4_new = zeros(301,1);

%% Go through the timings and set the timepoints corresponding to 0 to 0

EV1_new(1) = EV1(1);
EV2_new(1) = EV2(1);
EV3_new(1) = EV3(1);
EV4_new(1) = EV4(1);

    for itr = 1:60 
        
        EV1_new((2+5*(itr-1)):(6+5*(itr-1))) = EV1((4+7*(itr-1)):(8+7*(itr-1)));
        EV2_new((2+5*(itr-1)):(6+5*(itr-1))) = EV2((4+7*(itr-1)):(8+7*(itr-1)));
        EV3_new((2+5*(itr-1)):(6+5*(itr-1))) = EV3((4+7*(itr-1)):(8+7*(itr-1)));
        EV4_new((2+5*(itr-1)):(6+5*(itr-1))) = EV4((4+7*(itr-1)):(8+7*(itr-1)));

    end
%% Save to new design.mat
%fid = fopen(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/ISSSdesignfin_',run,'.txt'),'wt');
fid = fopen(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSSdesignWordfin_',run,'.txt'),'wt');
%fprintf(fid, '/NumWaves\t8\n');
fprintf(fid, '/NumWaves\t4\n');
fprintf(fid, '/NumPoints\t301\n');
fprintf(fid, '/PPheights ');
%fprintf(fid, '\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n', [max(EV1_new)-min(EV1_new) max(EV1_mot_new)-min(EV1_mot_new) max(EV2_new)-min(EV2_new) max(EV2_mot_new)-min(EV2_mot_new) max(EV3_new)-min(EV3_new) max(EV3_mot_new)-min(EV3_mot_new) max(EV4_new)-min(EV4_new) max(EV4_mot_new)-min(EV4_mot_new)]);
fprintf(fid, '\t%e\t%e\t%e\t%e\n', [max(EV1_new)-min(EV1_new) max(EV2_new)-min(EV2_new) max(EV3_new)-min(EV3_new) max(EV4_new)-min(EV4_new)]);
fprintf(fid, '\n');
fprintf(fid, '/Matrix\n');
fprintf(fid, '%e\t%e\t%e\t%e\n', [EV1_new EV2_new EV3_new EV4_new]);
fclose(fid);
%copyfile(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/ISSSdesignfin_',run,'.txt'),strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/ISSSdesignfin_',run,'.mat'));

%% Initialize variables.
filename = strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSS_word_run',run,'.con');
delimiter = '\t';
startRow = 8;
endRow = 8;

%% Format string for each line of text:
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%*s%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', delimiter, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
eff1 = dataArray{:, 1};
eff2 = dataArray{:, 2};
eff3 = dataArray{:, 3};
eff4 = dataArray{:, 4};


%% Clear temporary variables
clearvars filename delimiter startRow endRow formatSpec fileID dataArray ans;

%% Make new design.con
fid = fopen(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSSdesignWordCon_',run,'.txt'),'wt');
%fprintf(fid, '/NumWaves\t8\n');
fprintf(fid, '/ContrastName1\tAcc1Sg\n');
fprintf(fid, '/ContrastName2\tAcc1Pl\n');
fprintf(fid, '/ContrastName3\tAcc2Sg\n');
fprintf(fid, '/ContrastName4\tAcc2Pl\n');
fprintf(fid, '/NumWaves\t4\n');
fprintf(fid, '/NumContrasts\t4\n');
fprintf(fid, '/PPheights ');
%fprintf(fid, '\t%e\t%e\t%e\t%e\t%e\t%e\t%e\t%e\n', [max(EV1_new)-min(EV1_new) max(EV1_mot_new)-min(EV1_mot_new) max(EV2_new)-min(EV2_new) max(EV2_mot_new)-min(EV2_mot_new) max(EV3_new)-min(EV3_new) max(EV3_mot_new)-min(EV3_mot_new) max(EV4_new)-min(EV4_new) max(EV4_mot_new)-min(EV4_mot_new)]);
fprintf(fid, '\t%e\t%e\t%e\t%e\n', [max(EV1_new)-min(EV1_new) max(EV2_new)-min(EV2_new) max(EV3_new)-min(EV3_new) max(EV4_new)-min(EV4_new)]);
fprintf(fid, '\n');
fprintf(fid, '/RequiredEffect');
fprintf(fid, '\t%e\t%e\t%e\t%e\n', [eff1 eff2 eff3 eff4]);
fprintf(fid, '/Matrix\n');
fprintf(fid, '%e\t%e\t%e\t%e\n', [1 0 0 0]);
fprintf(fid, '%e\t%e\t%e\t%e\n', [0 1 0 0]);
fprintf(fid, '%e\t%e\t%e\t%e\n', [0 0 1 0]);
fprintf(fid, '%e\t%e\t%e\t%e\n', [0 0 0 1]);
fclose(fid);
copyfile(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSSdesignWordfin_',run,'.txt'),strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSSdesignWordfin_',run,'.mat'));
copyfile(strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSSdesignWordCon_',run,'.txt'),strcat('/Volumes/WordAccentData/1718_7T018/',subject,'/',subject,'_ISSSdesignWordfin_',run,'.con'));


end
