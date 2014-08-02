clear; clc;
figure(1); clf; hold on;
I = imread('carbon_fibers.jpg');
I = rgb2gray(I);
I_cropped = I;
imshow(I_cropped)
I_eq = adapthisteq(I_cropped);
imshow(I_eq)
bw = im2bw(I_eq, graythresh(I_eq));
imshow(bw)
bw2 = imfill(bw,'holes');
bw3 = imopen(bw2, ones(5,5));
bw4 = bwareaopen(bw3, 40);
bw4_perim = bwperim(bw4);
overlay1 = imoverlay(I_eq, bw4_perim, [.3 1 .3]);
imshow(overlay1)
