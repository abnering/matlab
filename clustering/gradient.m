% SG implementation
%Dirty code, vector optimisation is needed!

figure(1); clf; hold on;
figure(2); clf; hold on;
data  = csvread ('faithful.csv');
data = data(2:end,2:end);
w = zeros(2,2);

%assumptions about centroids
w(1,:) = [ 2 80];
w(2,:) = [ 4 100 ];
wtemp = w;
figure(1); 
	plot(data(:,1), data(:,2),'ro.', 'markersize', 5);
	plot (w(:,1),w(:,2), 'bo.','markersize', 20);

a = zeros(length(data),1);
Qtemp = zeros(length(data),1);
Q = 0;
euclidian_distance = zeros(length(data), size(w,2));

%Empirical risk
for (i=1:length(data))	
	euclidian_distance(i,1) =  norm (w(1,:) - data(i,:));%sqrt( (w(1,1) - data(i,1))^2 + (w(1,2) - data(i,2))^2);
	euclidian_distance(i,2) =  norm (w(2,:) - data(i,:));%sqrt( (w(2,1) - data(i,1))^2 + (w(2,2) - data(i,2))^2);
end;	

for (i=1:length(data))		 
	[z a(i)] = find(euclidian_distance(i,:) == min(euclidian_distance(i,:)));
end;

for (i=1:length(data))		 
	Q = Q +(w(a(i),1) - data(i,1))^2 + (w(a(i),2) - data(i,2))^2;
end;

%iterative process
nu = 0.1;
lambda = 0.003;
wplot1 = w(1,:);
wplot2 = w(2,:);
Qplot = Q;
for (j=1:length(data))	
	i =randi(length(data));
	euclidian_distance(i,1) =  norm (w(1,:) - data(i,:));%sqrt( (w(1,1) - data(i,1))^2 + (w(1,2) - data(i,2))^2);
	euclidian_distance(i,2) =  norm (w(2,:) - data(i,:));%sqrt( (w(2,1) - data(i,1))^2 + (w(2,2) - data(i,2))^2);
	
	[z b] = find(euclidian_distance(i,:) == min(euclidian_distance(i,:)));
	w(b,:) = w(b,:) + nu*(data(i,:) - w(b,:));
	
	%figure(1);
		%plot ([ wtemp(1,1); w(1,1)],[ wtemp(1,2); w(1,2)]);
		%plot ([ wtemp(2,1); w(2,1)],[ wtemp(2,2); w(2,2)]);
	
	if (b == 1)
		wplot1 = [wplot1; w(b,:)];
	else
		wplot2 = [wplot2; w(b,:)];
	end;
	Q = (1-lambda)*Q+lambda*((w(b,1) - data(i,1))^2 + (w(b,2) - data(i,2))^2);
	Qplot = [Qplot; Q];
	%figure(2); 
		%plot(j,Q,'bo.','markersize', 5);

end;

figure(1);
	plot (wplot1(:,1), wplot1(:,2));
	plot (wplot2(:,1), wplot2(:,2));
	plot (w(:,1),w(:,2), 'bo.','markersize', 30);

figure(2); 
	plot(Qplot);