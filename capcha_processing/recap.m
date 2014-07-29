clear;
N = 16;
data = zeros(1,2);
for (m = 1:N) 
    
    figure(1); clf; hold on;
    img  = imread(sprintf('%d.jpg',m));
    img = rgb2gray(img);
    e = edge(img,'canny');
    
    k=0;
    for (i = 1:size(e,2))
      for (j = 1:size(e,1))
            k = k+e(j,i);
       end;
        %plot(i, k, 'r.', 'markersize', 8);
        data = [data; i k];
       k=0;
    end;
    %plot(data(:,1),data(:,2),'r.', 'markersize', 8);
    [IDX, ctrs] = kmeans(data,5);
    scatter(data(:,1),data(:,2),50,IDX, 'filled');
    figure(2); clf; hold on;
    imshow(img);
    truesize
    figure(3); clf; hold on;
    %plot(ctrs(:,1),ctrs(:,2),'r.', 'markersize', 8);
    for (b = 2:size(ctrs, 1))
        s_crts = round(sortrows(ctrs,1));
        mid = round((s_crts(b,1) +  s_crts(b-1,1))/2);
        imshow(e(:,1:mid ));
        pause;
        %plot(mid,0,'g.', 'markersize', 8);
    end;
    ctrs =0;
    data = zeros(1,2);
    pause;
    
end;


