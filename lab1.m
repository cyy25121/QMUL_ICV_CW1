%% Transform
display('Computer Vision Lab1');

input = imread('myname.jpg');
output = zeros(720, 960, 3);

r30 = [cos(30*2*pi/180) -sin(30*2*pi/180); sin(30*2*pi/180) cos(30*2*pi/180)];

for i=1:640
    for j=1:960
        newPoint = round(r30 * [i; j]);
        if(newPoint(1) > 0 && newPoint(2) > 0)
            output(newPoint(1), newPoint(2), 1) = input(i, j, 1);
            output(newPoint(1), newPoint(2), 2) = input(i, j, 2);
            output(newPoint(1), newPoint(2), 3) = input(i, j, 3);
        end
    end
end

image(output)

