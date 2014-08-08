clear; clc;
figure(1); clf; hold on;
% img = imread('Toner0003.tif');
% BW = im2bw(img, 0.2);
% %imshow(BW);
% 
% Ibw = imfill(BW,'holes');
% imshow(BW); hold on;
% Ilabel = bwlabel(Ibw);
% stat = regionprops(Ilabel,'centroid');


 I = imread('Toner0003.tif');
 bw = im2bw(I, 0.5);
% stats = regionprops(bw,'FilledImage');


% I = rgb2gray(I);
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
%overlay1 = imoverlay(I_eq, bw4_perim, [.3 1 .3]);
imshow(bw4_perim)
bw5 = imfill(bw4_perim,'holes');



bw=bw5;
L = watershed(bw);
Lrgb = label2rgb(L);
imshow(Lrgb)
imshow(imfuse(bw,Lrgb))
axis([10 175 15 155])
bw2 = ~bwareaopen(~bw, 10);
imshow(bw2)
D = -bwdist(~bw);
imshow(D,[])

Ld = watershed(D);
imshow(label2rgb(Ld))
bw2 = bw;
bw2(Ld == 0) = 0;
imshow(bw2)
mask = imextendedmin(D,2);
imshowpair(bw,mask,'blend')
D2 = imimposemin(D,mask);
Ld2 = watershed(D2);
bw3 = bw;
bw3(Ld2 == 0) = 0;
imshow(bw3)

bw6 =bwareaopen(bw3, 40);
bw6 = bwperim(bw6);
overlay1 = imoverlay(I, bw6, [.3 1 .3]);
imshow(overlay1);
