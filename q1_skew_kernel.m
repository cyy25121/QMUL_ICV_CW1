function [map, mapped, mapImg, output1] = q1_skew_kernel(input, angle)
%% Initial
    inputS = size(input);
    bd = [0 inputS(1) inputS(1) 0; 0 0 inputS(2) inputS(2)];
    
%% Make rotate matrix
    sM = skew(angle);
    
%% Compute new boundary
    nbd = sM * bd;
    nbd_x = round(max(nbd(1, :))-min(nbd(1, :)));
    nbd_y = round(max(nbd(2, :))-min(nbd(2, :)));
    shift_x = round(abs(min(nbd(1,:))));
    shift_y = round(abs(min(nbd(2,:))));

%% Kernel
    map = 0;
    mappedM = zeros(nbd_x, nbd_y);
    mapImg = uint8(zeros(nbd_x, nbd_y, 3));
    outImg = uint8(zeros(nbd_x, nbd_y, 3));
    for i=1:size(input, 1)
        for j=1:size(input, 2)
            newPoint = round(sM * [i; j] + [shift_x; shift_y]);
            if(newPoint(1) >= 1 && newPoint(2) >= 1 && newPoint(1) <= nbd_x && newPoint(2) <= nbd_y)
                map = map + 1;
                mappedM(newPoint(1), newPoint(2)) = 1;
                mapImg(newPoint(1), newPoint(2), :) = 255;
                outImg(newPoint(1), newPoint(2), :) = input(i, j, :);
            end
        end
    end
    mapped = sum(sum(mappedM));
    output1 = outImg;
    output2 = output1;
    output3 = output1;
%{    
%% Interpolation - NN    

    output2 = output1;
    for new_x=1:nbd_x
        for new_y=1:nbd_y
            if(mappedM(new_x, new_y) == 0)
                if(new_x - 1 >= 1&& new_y - 1 >= 1)
                    output2(new_x, new_y, :) = output2(new_x - 1, new_y - 1, :);
                end
            end
        end
    end
%% Interpolation - Inverse

    output3 = output1;
    for new_x=1:nbd_x
        for new_y=1:nbd_y
            ori = round(rM \ ([new_x; new_y]  - [shift_x; shift_y]));
            % newPoint = round(rM * [i; j]) + [shift_x; shift_y] ;
            if((ori(1) >= 1 ) && (ori(2) >= 1 ) && (ori(1) <= inputS(1)) && (ori(2) <= inputS(2))) 
                output3(new_x, new_y, :) = input(ori(1), ori(2), :);
            end
        end
    end
%}
end