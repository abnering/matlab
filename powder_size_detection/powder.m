clear; clc;
figure(1); clf; hold on;
img = imread('carbon_fibers.jpg');
imgbw = rgb2gray(img);
BW = im2bw(imgbw, 0.78);

Ibw = imfill(BW,'holes');
Ilabel = bwlabel(Ibw);
stat = regionprops(Ilabel,'centroid');
imshow(BW); hold on;
for x = 1: numel(stat)
    plot(stat(x).Centroid(1),stat(x).Centroid(2),'ro');
end

data = zeros(1,2);
for (r = 1:size(BW,1))
   for (c = 1:size(BW,2))
    if (BW(r,c) == 1)
        data = [data; r c];        
    end;
   end; 
end;
%plot(data(:,1), data(:,2), 'bo', 'markersize', 2);

figure(2); clf; hold on;
labeledImage = bwlabel(BW)
measurements = regionprops(labeledImage, 'EquivDiameter');
allDiameters = [measurements.EquivDiameter];
numberOfBins = 50; % Or whatever you want.
[diamDistribution binDiameters] = hist(allDiameters, numberOfBins);
bar(binDiameters, diamDistribution, 'BarWidth', 1.0);