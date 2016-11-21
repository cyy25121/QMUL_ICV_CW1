% Not to adrress the border
function [outImg] = ICV_q2_33filter(inputImg, filterM)
    [sizeX, sizeY, ~] = size(inputImg);
    shift = min(min(filterM));
    all = sum(sum(abs(filterM)));
    
    %outImg = uint8(zeros(sizeX, sizeY));
    outImg = zeros(sizeX, sizeY);
    for iX=1:sizeX
        for iY=1:sizeY
            if(iX == 1 || iY == 1 || iX == sizeX || iY == sizeY)
                outImg(iX, iY) = double(inputImg(iX, iY));
            else
                for tX=iX-1:iX+1
                    for tY=iY-1:iY+1
                        outImg(iX, iY) = outImg(iX, iY) + double(inputImg(tX, tY)) *  filterM(tX-iX+2, tY-iY+2);
                    end
                end
            end
        end
    end
    outImg = uint8(outImg);
end