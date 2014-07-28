data  = csvread ('faithful.csv');
data = data(2:end,2:end);
figure(1);
w = zeros(2,2);

w(1,:) = [ 2 70];
w(2,:) = [ 4 90 ];
wtemp = w;
plot(data(:,1), data(:,2),'ro.', 'markersize', 5);
hold on;
plot (w(:,1),w(:,2), 'bo.','markersize', 50);

euclidian_distance = zeros(length(data), size(w,2));

for (i=1:length(data))

end;

nu = 0.1;

for (j=1:length(data)+300)	
	i =randi(length(data));
	euclidian_distance(i,1) =  sqrt( (w(1,1) - data(i,1))^2 + (w(1,2) - data(i,2))^2);
	euclidian_distance(i,2) =  sqrt( (w(2,1) - data(i,1))^2 + (w(2,2) - data(i,2))^2);
	
	[a b] = find(euclidian_distance(i,:) == min(euclidian_distance(i,:)));
	w(b,:) = w(b,:) + nu*(data(i,:) - w(b,:));
	%plot (w(:,1),w(:,2), 'bo.','markersize', 50);
	plot ([ wtemp(1,1); w(1,1)],[ wtemp(1,2); w(1,2)]);
	plot ([ wtemp(2,1); w(2,1)],[ wtemp(2,2); w(2,2)]);
	%plot ([ wtemp(:,1); w(:,1)],[ wtemp(:,2); w(:,2)]);
	wtemp = w;
	%pause
end;
plot (w(:,1),w(:,2), 'bo.','markersize', 50);
hold off;