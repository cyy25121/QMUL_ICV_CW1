%% Read Data
disp('Intorduction of Computer Vision Coursework 1 - Q1: Transformation');
clc; clear;
input = imread('Dataset/DatasetA/car-1.jpg');
%input = imread('input/myname.jpg');
input_gray = input(:,:,1) * 0.299 + input(:,:,2) * 0.587 + input(:,:,3) * 0.114;
figure
imshow(input_gray);

%% a) Mean filter
% In this practice, I don't handle the border.

% The 3*3 matrix of mean filter 
meanM = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
figure
outImg = ICV_q2_33filter(input_gray, meanM);
imshow(outImg);

%% b1) other filters

kernelA = [1 2 1; 2 4 2; 1 2 1] / 16;
figure
outImg = ICV_q2_33filter(input_gray, kernelA);
imshow(outImg);

%% b2) other filters

kernelB = [0 1 0; 1 -4 1; 0 1 0];
figure
outImg = ICV_q2_33filter(input_gray, kernelB);
imshow(outImg);

%% c1) A followed by A

figure
outImg = ICV_q2_33filter(input_gray, kernelA);
outImg = ICV_q2_33filter(outImg, kernelA);
imshow(outImg);

%% c2) A followed by B

figure
outImg = ICV_q2_33filter(input_gray, kernelA);
outImg = ICV_q2_33filter(outImg, kernelB);
imshow(outImg);

%% c3) B followed by A

figure
outImg = ICV_q2_33filter(input_gray, kernelB);
outImg = ICV_q2_33filter(outImg, kernelA);
imshow(outImg);

%% d1)

figure 
kernelA_77 = [1 2 4 8 4 2 1; 2 4 8 16 8 4 2; 4 8 16 32 16 8 4; 8 16 32 64 32 16 8; 4 8 16 32 16 8 4; 2 4 8 16 8 4 2; 1 2 4 8 4 2 1] * 1/484;
outImg = ICV_q2_77filter(input_gray, kernelA_77);
imshow(outImg);

%% d2)

figure
kernelB_77 = [0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 1 1 1 -12 1 1 1; 0 0 0 1 0 0 0; 0 0 0 1 0 0 0; 0 0 0 1 0 0 0];
outImg = ICV_q2_77filter(input_gray, kernelB_77);
imshow(outImg);