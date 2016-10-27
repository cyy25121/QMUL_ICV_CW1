%% Read data
disp('Intorduction of Computer Vision Coursework 1 - Q1: Transformation');
figure(1);
input = imread('input/myname.jpg');
image(input);
%% Kernel
angles = [30, 60, 120, -50];
i=2;
for ang = angles
    img = q1_rotate_kernel(input, ang);
    figure(i);
    image(img);
    i=i+1;
end


