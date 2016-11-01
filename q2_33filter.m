% Not to adrress the border
function [outImg] = q2_33filter(inputImg, filterM)
    [sizeX, sizeY, ~] = size(inputImg);
    
    outImg = uint8(zeros(sizeX, sizeY, 3));
    for iX=1:sizeX
        for iY=1:sizeY
            if(iX == 1 || iY == 1 || iX == sizeX || iY == sizeY)
                outImg(iX, iY, :) = inputImg(iX, iY, :);
            else
                for tX=iX-1:iX+1
                    for tY=iY-1:iY+1
                        outImg(iX, iY, :) = outImg(iX, iY, :) + (inputImg(tX, tY, :) *  filterM(tX-iX+2, tY-iY+2));
                    end
                end
            end
        end
    end
end