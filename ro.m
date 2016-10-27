function m = ro(angle)
    m = [cos(angle*2*pi/360) -sin(angle*2*pi/360); sin(angle*2*pi/360) cos(angle*2*pi/360)];
end