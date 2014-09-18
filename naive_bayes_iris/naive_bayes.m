clear; clc; close all;

load('iris_data');
load('test_data.txt');
X = iris_data;
T = test_data;
gplotmatrix(X(:,1:(end-1)),[],X(:,end),['r' 'g' 'b'],[],[],false);

%estimate distribution parametes like freq
classes = 3;
m = zeros(3,size(X,2));
s = zeros(3,size(X,2));
prior = zeros(3,1);
for i = 1:classes
    c = find(X(:,end) == i);
    prior(i) = numel(c)/length(X);
    m(i,:) = mean(X(c,:));
    s(i,:) = std(X(c,:));
end;


%classify test data
for k = 1:size(T,1)
    likelihood = ones(3,1);
    posterior = ones(3,1);
    for i = 1:classes
     for j = 1:(size(m,2) - 1)
            likelihood(i) = likelihood(i) * normpdf(T(k,j),m(i,j),s(i,j)); 
      end;
     posterior(i) = prior(i) * likelihood(i);
     
    end;
    MAP = find(posterior == max(posterior));
    sprintf('Real class = %d, MAP class = %d',T(k,end), MAP)
end;

fill_data = ones(100,5);

for i = 1:(length(fill_data) - 1)
    c = datasample([1 2 3], 1);
    for j = 1:size(fill_data,2)
        fill_data(i,j) = m(c, j) + s(c, j) * randn(1);
    end;
end;

figure(2); clf; hold on;
    gplotmatrix(fill_data(:,1:(end-1)),[],fill_data(:,end),['r' 'g' 'b'],[],[],false);
hold off;
