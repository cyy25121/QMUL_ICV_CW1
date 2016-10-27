function img = q1_rotate_kernel(input, angle)
%% Initial
    inputS = size(input);
    bd = [0 inputS(1) inputS(1) 0; 0 0 inputS(2) inputS(2)];
%% Make rotate matrix
    rM = ro(angle);
%% Compute new boundary
    nbd = rM * bd;
    nbd_x = max(nbd(1, :))-min(nbd(1, :));
    nbd_y = max(nbd(2, :))-min(nbd(2, :));
    shift_x = round(abs(min(nbd(1,:))));
    shift_y = round(abs(min(nbd(2,:))));

%% Kernel
    output1 = ones(round(nbd_x), round(nbd_y), 3);
    for i=1:inputS(1)
        for j=1:inputS(2)
            newPoint = round(rM * [i; j]) + [shift_x; shift_y] ;
            if(newPoint(1) > 0 && newPoint(2) > 0)
                output1(newPoint(1), newPoint(2), 1) = input(i, j, 1);
                output1(newPoint(1), newPoint(2), 2) = input(i, j, 2);
                output1(newPoint(1), newPoint(2), 3) = input(i, j, 3);
            end
        end
    end
    img = output1;
end