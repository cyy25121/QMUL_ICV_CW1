%% Read Data
disp('Intorduction of Computer Vision Coursework 1 - Q3: Histogram');
input = imread('Dataset/DatasetA/face-3.jpg');

v = VideoReader('Dataset/DatasetB.avi');

%% a) Histogram 

figure
while hasFrame(v)
    fr = readFrame(v);
    subplot(1, 4, 1);
    image(fr);
    subplot(1, 4, 2);
    h1 = histogram(fr(:, :, 1));
    title('R channel');
    subplot(1, 4, 3);
    h2 = histogram(fr(:, :, 2));
    title('G channel');
    subplot(1, 4, 4);
    h3 = histogram(fr(:, :, 3));
    title('B channel');
end

%% b)

v = VideoReader('Dataset/DatasetB.avi');
figure
isHead = 1;
intFrame = 0;
while hasFrame(v)
    fprintf('%d\n', intFrame);
    current = readFrame(v);
    subplot(2, 4, 1);
    image(current);
    subplot(2, 4, 2);
    current_hR = histogram(current(:, :, 1), 'Normalization','probability', 'NumBins' , 30);
    hold on
    subplot(2, 4, 3);
    current_hG = histogram(current(:, :, 2), 'Normalization','probability', 'NumBins' , 30);
    hold on
    subplot(2, 4, 4);
    current_hB = histogram(current(:, :, 3), 'Normalization','probability', 'NumBins' , 30);
    hold on
    if(isHead == 1)
        isHead = 0;
    else       
        subplot(2, 4, 2);
        pre_hR = histogram(pre(:, :, 1), 'Normalization','probability', 'NumBins' , 30);
        hold off
        subplot(2, 4, 6);
        ylim([0 10]);
        line(pre_hR.BinEdges(2:31), abs(current_hR.BinCounts-pre_hR.BinCounts));
        hold off
        subplot(2, 4, 3);
        pre_hG = histogram(pre(:, :, 2), 'Normalization','probability', 'NumBins' , 30);
        hold off
        subplot(2, 4, 7);
        line(pre_hG.BinEdges(2:31), abs(norm(current_hG.BinCounts)-norm(pre_hG.BinCounts)));
        subplot(2, 4, 4);
        pre_hB = histogram(pre(:, :, 3), 'Normalization','probability', 'NumBins' , 30);
        hold off
        subplot(2, 4, 8);
        line(pre_hB.BinEdges(2:31), abs(norm(current_hB.BinCounts)-norm(pre_hB.BinCounts)));
    end
    intFrame = intFrame + 1;
    pre = current;
end
