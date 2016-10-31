%% Read data
disp('Intorduction of Computer Vision Coursework 1 - Q1: Transformation');
figure(1);
input = imread('input/myname.jpg');
%input = imread('input/myname.jpg');
image(input);
i=1;
%% Rotate
angles = [30 60 120 -50];
for ang = angles
    figure(i)
    [m1, m2, mapImg, outImg1, outImg2, outImg3]  = q1_rotate_kernel(input, ang);
    subplot(1,4,1);
    imshow(mapImg);
    subplot(1,4,2);
    imshow(outImg1);
    subplot(1,4,3);
    imshow(outImg2);
    subplot(1,4,4);
    imshow(outImg3);
    i=i+1;
end
%% Skew
angles = [10 40 60];
for ang = angles
    figure(i)
    [m1, m2, mapImg, outImg1]  = q1_skew_kernel(input, ang);
    subplot(1, 2, 1);
    imshow(mapImg);
    subplot(1, 2, 2);
    imshow(outImg1);
    i=i+1;
end

%% Compare -1 S(R(x))

figure
[m1, m2, mapImg, outImg1, outImg2, outImg3] = q1_rotate_kernel(input, 20);
[m1, m2, mapImg, outImg1] = q1_skew_kernel(outImg3, 50);
imshow(outImg1);

%% Compare -2 R(S(x))
figure
[m1, m2, mapImg, outImg1] = q1_skew_kernel(input, 20);
[m1, m2, mapImg, outImg1, outImg2, outImg3] = q1_rotate_kernel(outImg1, 50);
imshow(outImg3);
