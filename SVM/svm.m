close all; clc; clear all; clear figures;
%% generate data

% features
sd = 1.1;
x_data(1:500,:) = 6+sd*randn(500,2);
x_data(501:1000,:) = sd*randn(500,2);
x_data(1:1000, 3) = ones(1000,1);
x_hyperplane = -4:12;
b = 6;
y_hyperplane = -x_hyperplane+b;

% labels according to hyperplane
x_data(:,4) = 2*(x_data(:,2) >= -x_data(:,1)+6)-1;
labels = x_data(:,4);
%% SVM
% visualization
figure
axis equal
hold on;
    % data
    plot(x_data(labels == 1,1),x_data(labels == 1,2),'Color','red','LineStyle','x');
    plot(x_data(labels ~= 1,1),x_data(labels ~= 1,2),'Color','blue','LineStyle','o');
    
    % hyperplane
    plot(x_hyperplane, y_hyperplane, 'green','LineStyle','--');
    
    % normal line
    w = [1,1];
    plot(1:10,[1:10]-7,'LineStyle','-', 'Color', 'magenta','LineWidth', 2);
    
    
    
% perpendicular distance from the hyperplane to the origin
distance_origin = abs(b) / norm(w);

%% quadratic programming problem

b = ones(1000, 1);
Y = repmat(labels, 1, 3);
cvx_begin
    variable w(3)
    minimize norm(w)
    subject to
    (Y.*x_data(:,1:3))*w >= b
cvx_end

a = -w(1)/w(2)
b = -w(3)/w(2)
plot(x_hyperplane, a*x_hyperplane+b,'Color', 'black','LineStyle','-.','LineWidth', 2);
plot(x_hyperplane, (1/w(2)) + a*x_hyperplane+b,'Color', 'black','LineStyle','-','LineWidth', 2);
plot(x_hyperplane, (-1/w(2)) + a*x_hyperplane+b,'Color', 'black','LineStyle','-','LineWidth', 2);

title('SVM');
legend('class 1', 'class 2','Descision boundary', 'Normal line for descision surface', 'wx+b = 0');

hold off;

%% Naive Bayes
mu_e = [mean(x_data(labels == 1,1:2)); mean(x_data(labels == -1,1:2))];
std_e = [std(x_data(labels == 1,1:2)); std(x_data(labels == -1,1:2))];
prior_mle = [sum(x_data(labels == 1,4))/length(x_data); (length(x_data)-sum(x_data(labels == 1,4)))/length(x_data)];
posterior_proportional_plus = normpdf(1,mu_e(1,1),std_e(1,1))*normpdf(1,mu_e(1,2),std_e(1,2))*prior_mle(1)
posterior_proportional_minus = normpdf(1,mu_e(2,1),std_e(2,1))*normpdf(1,mu_e(2,2),std_e(2,2))*prior_mle(2)
figure
hold on;
for i = -6:0.5:14
    for j = -6:0.5:14
        posterior_proportional_plus = normpdf(i,mu_e(1,1),std_e(1,1))*normpdf(j,mu_e(1,2),std_e(1,2))*prior_mle(1)
        posterior_proportional_minus = normpdf(i,mu_e(2,1),std_e(2,1))*normpdf(j,mu_e(2,2),std_e(2,2))*prior_mle(2)
        if posterior_proportional_plus > posterior_proportional_minus
            plot(i,j,'.','Color', 'red')
        else
            plot(i,j,'.','Color', 'blue')
        end
    end
end
title('Naive Bayes');
hold off;