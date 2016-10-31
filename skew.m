function m = skew(angle)
    m = [1 1/tan(angle*2*pi/360); 0 1];
end