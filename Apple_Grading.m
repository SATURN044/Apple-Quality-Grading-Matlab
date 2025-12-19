%% Automated Apple Quality Grading using Image Processing
% Developed by Mohammad Feyzi
% This script detects bruises on apples and calculates a quality score.

clc; clear; close all;

% --- Configuration ---
imageFolder = 'apple_images/'; % Path to your dataset
imageFiles = dir(fullfile(imageFolder, '*.jpg')); 
numImages = length(imageFiles);

% Initialize Result Arrays
appleNames = cell(numImages, 1);
bruisePercentages = zeros(numImages, 1);
qualityRatings = zeros(numImages, 1);

for i = 1:numImages
    % Load Image
    imageName = imageFiles(i).name;
    appleImage = imread(fullfile(imageFolder, imageName));
    
    % Convert to HSV Color Space
    hsvImage = rgb2hsv(appleImage);
    hChannel = hsvImage(:,:,1);
    sChannel = hsvImage(:,:,2);
    vChannel = hsvImage(:,:,3);
    
    % --- Segmentation ---
    % Thresholds for identifying the apple (Red/Yellow spectrum)
    appleMask = (hChannel > 0.03 & hChannel < 0.3) & (sChannel > 0.4);
    cleanedAppleMask = imfill(bwareaopen(appleMask, 500), 'holes');
    
    % --- Bruise Detection ---
    % Bruises are usually darker and have different saturation values
    bruiseMask = (vChannel < 0.5) & cleanedAppleMask;
    cleanedBruiseMask = bwareaopen(bruiseMask, 100);
    
    % --- Quantitative Analysis ---
    numApplePixels = sum(cleanedAppleMask(:));
    numBruisePixels = sum(cleanedBruiseMask(:));
    
    % Calculate Percentage and Rating
    bruisePercent = (numBruisePixels / numApplePixels) * 100;
    % Quality score: 100 is perfect, decreases as bruise area increases
    rating = max(0, 100 - (bruisePercent * 5)); 
    
    % Save Results
    appleNames{i} = imageName;
    bruisePercentages(i) = bruisePercent;
    qualityRatings(i) = rating;
    
    fprintf('Processed: %s | Bruise: %.2f%% | Rating: %.2f/100\n', ...
            imageName, bruisePercent, rating);
end

% --- Display Results Table ---
ResultsTable = table(appleNames, bruisePercentages, qualityRatings, ...
    'VariableNames', {'Apple_ID', 'Bruise_Area_Percent', 'Quality_Score'});
disp(ResultsTable);
