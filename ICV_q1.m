%% Read data
disp('Intorduction of Computer Vision Coursework 1 - Q1: Transformation');
clc; clear; clf;
figure
input = imread('input/myname.jpg');
%input = imread('Dataset/DatasetA/car-1.jpg');
imshow(input);
title('Original images');
%% Rotate
angles = [30 60 120 -50];
%angles = [-50];
for ang = angles
    figure
    [m1, m2, mapImg, outImg1, outImg2, outImg3]  = ICV_q1_rotate_kernel(input, ang);
    subplot(2,2,1);
    imshow(mapImg);
    title(strcat(strcat('Unmapping Matrix: ', int2str(ang), ' degree')));
    subplot(2,2,2);
    imshow(outImg1);
    title(strcat(strcat('Directly rotate matrix: ', int2str(ang), ' degree')));
    subplot(2,2,3);
    imshow(outImg2);
    title(strcat(strcat('Directly rotate matrix with NN: ', int2str(ang), ' degree')));
    subplot(2,2,4);
    imshow(outImg3);
    title(strcat(strcat('Inverse mapping: ', int2str(ang), ' degree')));
end
%% Skew
%angles = [10 40 60];
angles = [60];
for ang = angles
    figure
    [m1, m2, mapImg, outImg1]  = ICV_q1_skew_kernel(input, ang);
    subplot(1, 2, 1);
    imshow(mapImg);
    subplot(1, 2, 2);
    imshow(outImg1);
end

%% Compare -1 S(R(x))

figure
[m1, m2, mapImg, outImg1, outImg2, outImg3] = ICV_q1_rotate_kernel(input, 20);
[m1, m2, mapImg, outImg1] = ICV_q1_skew_kernel(outImg3, 50);
imshow(outImg1);

%% Compare -2 R(S(x))

figure
[m1, m2, mapImg, outImg1] = ICV_q1_skew_kernel(input, 50);
[m1, m2, mapImg, outImg1, outImg2, outImg3] = ICV_q1_rotate_kernel(outImg1, 20);
imshow(outImg3);
