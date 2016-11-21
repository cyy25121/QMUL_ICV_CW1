%% Read Data
disp('Intorduction of Computer Vision Coursework 1 - Q3: Histogram');
input = imread('Dataset/DatasetA/face-3.jpg');

v = VideoReader('Dataset/DatasetB.avi');

%% a) Histogram 
v = VideoReader('Dataset/DatasetB.avi');
figure
isCond = 1;
count = 0;
while (hasFrame(v) && isCond)
    fr = readFrame(v);
    if(count == 100)
        f1 = fr;
    elseif(count == 300)
        f2 = fr;
        isCond = 0;
    end
    count = count + 1;
end

    subplot(4, 2, 1);
    imshow(f1);
    subplot(4, 2, 3);
    h1 = histogram(f1(:, :, 1), 'NumBins', 50);
    h1.FaceColor = [1 0 0];
    ylim([0 20000]);
    title('R channel');
    subplot(4, 2, 5);
    h2 = histogram(f1(:, :, 2), 'NumBins', 50);
    h2.FaceColor = [0 1 0];
    ylim([0 20000]);
    title('G channel');
    subplot(4, 2, 7);
    h3 = histogram(f1(:, :, 3), 'NumBins', 50);
    h3.FaceColor = [0 0 1];
    ylim([0 20000]);
    title('B channel');
    
    subplot(4, 2, 2);
    imshow(f2);
    subplot(4, 2, 4);
    h1 = histogram(f2(:, :, 1), 'NumBins', 50);
    h1.FaceColor = [1 0 0];
    ylim([0 20000]);
    title('R channel');
    subplot(4, 2, 6);
    h2 = histogram(f2(:, :, 2), 'NumBins', 50);
    h2.FaceColor = [0 1 0];
    ylim([0 20000]);
    title('G channel');
    subplot(4, 2, 8);
    h3 = histogram(f2(:, :, 3), 'NumBins', 50);
    h3.FaceColor = [0 0 1];
    ylim([0 20000]);
    title('B channel');

%% b1)

v = VideoReader('Dataset/DatasetB.avi');
figure
isCond = 1;
count = 0;
while (hasFrame(v) && isCond)
    fr = readFrame(v);
    if(count == 70)
        f1 = fr;
    elseif(count == 71)
        f2 = fr;
        isCond = 0;
    end
    count = count + 1;
end

    subplot(4, 3, 1);
    imshow(f1);
    title('Frame = 70');
    subplot(4, 3, 4);
    h1 = histogram(f1(:, :, 1), 'NumBins', 50);
    h1.FaceColor = [1 0 0];
    ylim([0 10000]);
    title('R channel');
    subplot(4, 3, 7);
    h2 = histogram(f1(:, :, 2), 'NumBins', 50);
    h2.FaceColor = [0 1 0];
    ylim([0 10000]);
    title('G channel');
    subplot(4, 3, 10);
    h3 = histogram(f1(:, :, 3), 'NumBins', 50);
    h3.FaceColor = [0 0 1];
    ylim([0 10000]);
    title('B channel');
    
    subplot(4, 3, 2);
    imshow(f2);
    title('Frame : 71');
    subplot(4, 3, 5);
    h4 = histogram(f2(:, :, 1), 'NumBins', 50);
    h4.FaceColor = [1 0 0];
    ylim([0 10000]);
    title('R channel');
    subplot(4, 3, 8);
    h5 = histogram(f2(:, :, 2), 'NumBins', 50);
    h5.FaceColor = [0 1 0];
    ylim([0 10000]);
    title('G channel');
    subplot(4, 3, 11);
    h6 = histogram(f2(:, :, 3), 'NumBins', 50);
    h6.FaceColor = [0 0 1];
    ylim([0 10000]);
    title('B channel');
    
    subplot(4, 3, 6);
    h7 = bar(1:50, min(([h1.BinCounts ; h4.BinCounts])));
    line(1:50, abs(h1.BinCounts - h4.BinCounts), 'Color', 'r');
    h7.FaceColor = [1 1 0];
    ylim([0 10000]);
    title('R channel');
    subplot(4, 3, 9);
    h8 = bar(1:50, min(([h2.BinCounts ; h5.BinCounts])));
    line(1:50, abs(h2.BinCounts - h5.BinCounts), 'Color', 'r');
    h8.FaceColor = [1 1 0];
    ylim([0 10000]);
    title('G channel');
    subplot(4, 3, 12);
    h9 = bar(1:50, min(([h3.BinCounts ; h6.BinCounts])));
    line(1:50, abs(h3.BinCounts - h6.BinCounts), 'Color', 'r');
    h9.FaceColor = [1 1 0];
    ylim([0 10000]);
    title('B channel');
    
%% b2)

v = VideoReader('Dataset/DatasetB.avi');
figure
isCond = 1;
count = 0;
while (hasFrame(v) && isCond)
    fr = readFrame(v);
    if(count == 70)
        f1 = fr;
    elseif(count == 71)
        f2 = fr;
        isCond = 0;
    end
    count = count + 1;
end

    subplot(4, 3, 1);
    imshow(f1);
    title('Frame : 70');
    subplot(4, 3, 4);
    h1 = histogram(f1(:, :, 1), 'NumBins', 50, 'Normalization','probability');
    h1.FaceColor = [1 0 0];
    title('R channel');
    subplot(4, 3, 7);
    h2 = histogram(f1(:, :, 2), 'NumBins', 50, 'Normalization','probability');
    h2.FaceColor = [0 1 0];
    title('G channel');
    subplot(4, 3, 10);
    h3 = histogram(f1(:, :, 3), 'NumBins', 50, 'Normalization','probability');
    h3.FaceColor = [0 0 1];
    title('B channel');
    
    subplot(4, 3, 2);
    imshow(f2);
    title('Frame : 71');
    subplot(4, 3, 5);
    h4 = histogram(f2(:, :, 1), 'NumBins', 50, 'Normalization','probability');
    h4.FaceColor = [1 0 0];
    title('R channel');
    subplot(4, 3, 8);
    h5 = histogram(f2(:, :, 2), 'NumBins', 50, 'Normalization','probability');
    h5.FaceColor = [0 1 0];
    title('G channel');
    subplot(4, 3, 11);
    h6 = histogram(f2(:, :, 3), 'NumBins', 50, 'Normalization','probability');
    h6.FaceColor = [0 0 1];
    title('B channel');
    
    subplot(4, 3, 6);
    ylim auto;
    h7 = bar(1:50, min(([h1.Values ; h4.Values])));
    line(1:50, abs(h1.Values - h4.Values), 'Color', 'r');
    h7.FaceColor = [1 1 0];
    title('R channel');
    subplot(4, 3, 9);
    h8 = bar(1:50, min(([h2.Values ; h5.Values])));
    line(1:50, abs(h2.Values - h5.Values), 'Color', 'r');
    h8.FaceColor = [1 1 0];
    title('G channel');
    subplot(4, 3, 12);
    h9 = bar(1:50, min(([h3.Values ; h6.Values])));
    line(1:50, abs(h3.Values - h6.Values), 'Color', 'r');
    h9.FaceColor = [1 1 0];
    title('B channel');  

%% c)

v = VideoReader('Dataset/DatasetB.avi');
figure
isHead = 1;
count = 1;
while hasFrame(v)
    current = readFrame(v);
    subplot(2, 4, 1);
    imshow(current);
    title(strcat('Frame : ', int2str(count)));
    subplot(2, 4, 2);
    current_hR = histogram(current(:, :, 1), 'NumBins' , 30);
    hold on
    subplot(2, 4, 3);
    current_hG = histogram(current(:, :, 2), 'NumBins' , 30);
    hold on
    subplot(2, 4, 4);
    current_hB = histogram(current(:, :, 3), 'NumBins' , 30);
    hold on
    if(isHead == 1)
        isHead = 0;
    else       
        subplot(2, 4, 2);
        pre_hR = histogram(pre(:, :, 1), 'NumBins' , 30);
        hold off
        subplot(2, 4, 6);
        b1 = bar(1:30, min(([pre_hR.Values ; current_hR.Values])));
        line(1:30, abs(pre_hR.Values - current_hR.Values), 'Color', 'r');
        b1.FaceColor = [1 1 0];
        hold off
        subplot(2, 4, 3);
        pre_hG = histogram(pre(:, :, 2), 'NumBins' , 30);
        hold off
        subplot(2, 4, 7);
        b2 = bar(1:30, min(([pre_hG.Values ; current_hG.Values])));
        line(1:30, abs(pre_hG.Values - current_hG.Values), 'Color', 'r');
        b2.FaceColor = [1 1 0];
        hold off
        subplot(2, 4, 4);
        pre_hB = histogram(pre(:, :, 3), 'NumBins' , 30);
        hold off
        subplot(2, 4, 8);
        b3 = bar(1:30, min(([pre_hB.Values ; current_hB.Values])));
        line(1:30, abs(pre_hB.Values - current_hB.Values), 'Color', 'r');
        b3.FaceColor = [1 1 0];
    end
    pre = current;
    count = count + 1;
end
