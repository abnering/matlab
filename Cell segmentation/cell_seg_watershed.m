bw = imread('foto.bmp');
bw = rgb2gray(bw);
 bw = edge(bw,'canny');
 imshow(bw)
% %bw = im2bw(bw, 0.4);
% L = watershed(bw);
% Lrgb = label2rgb(L);
% imshow(Lrgb)
% imshow(imfuse(bw,Lrgb))
% axis([10 175 15 155])
% bw2 = ~bwareaopen(~bw, 10);
% imshow(bw2)
% D = -bwdist(~bw);
% imshow(D,[])
% 
% Ld = watershed(D);
% imshow(label2rgb(Ld))
% bw2 = bw;
% bw2(Ld == 0) = 0;
% imshow(bw2)
% mask = imextendedmin(D,2);
% imshowpair(bw,mask,'blend')
% D2 = imimposemin(D,mask);
% Ld2 = watershed(D2);
% bw3 = bw;
% bw3(Ld2 == 0) = 0;
% imshow(bw3)