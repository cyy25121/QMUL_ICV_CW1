%% Read Data
disp('Intorduction of Computer Vision Coursework 1 - Q1: Transformation');
input = imread('Dataset/DatasetA/face-3.jpg');
figure
imshow(input);

%% a) Mean filter
% In this practice, I don't handle the border.

% The 3*3 matrix of mean filter 
meanM = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
figure
outImg = q2_33filter(input, meanM);
imshow(outImg);

%% b1) other filters

kernel1 = [1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];
figure
outImg = q2_33filter(input, kernel1);
imshow(outImg);

%% b2) other filters

kernel2 = [0 1 0; 1 -4 1; 0 1 0];
figure
outImg = q2_33filter(input, kernel2);
imshow(outImg);

%% c1) A followed by A

figure
outImg = q2_33filter(input, kernel1);
outImg = q2_33filter(outImg, kernel1);
imshow(outImg);

%% c2) A followed by B

figure
outImg = q2_33filter(input, kernel1);
outImg = q2_33filter(outImg, kernel2);
imshow(outImg);

%% c3) B followed by A

figure
outImg = q2_33filter(input, kernel2);
outImg = q2_33filter(outImg, kernel1);
imshow(outImg);

%% d1)

figure 
kernelA_77 = [1 2 4 8 4 2 1; 2 4 8 16 8 4 2; 4 8 16 32 16 8 4; 8 16 32 64 32 16 8; 4 8 16 32 16 8 4; 2 4 8 16 8 4 2; 1 2 4 8 4 2 1] * 1/484;
outImg = q2_77filter(input, kernelA_77);
imshow(outImg);

%% d2)

figure
kernelB_77 = [0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 1 1 1 -12 1 1 1; 0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 0 0 0 1 0 0 0];
outImg = q2_77filter(input, kernelB_77);
imshow(outImg);