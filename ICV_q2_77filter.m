% Not to adrress the border
function [outImg] = ICV_q2_77filter(inputImg, filterM)
    [sizeX, sizeY, ~] = size(inputImg);
    
    outImg = uint8(zeros(sizeX, sizeY));
    for iX=1:sizeX
        for iY=1:sizeY
            if((iX >= 1 && iX <=3)|| (iY >= 1 && iY <= 3) || (iX <= sizeX && iX >= sizeX - 3)|| (iY <= sizeY && iY >= sizeY - 3))
                outImg(iX, iY) = inputImg(iX, iY);
            else
                for tX=iX-3:iX+3
                    for tY=iY-3:iY+3
                        outImg(iX, iY) = outImg(iX, iY) + (inputImg(tX, tY) *  filterM(tX-iX+4, tY-iY+4));
                    end
                end
            end
        end
    end
end