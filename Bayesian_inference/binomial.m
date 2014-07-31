% head-tails data see barber page 192 Learning as Inference
clear;
clc;
H = 1;
T = 0;
%data = [ H T H H T T T H H T H T T H T H T ];
%data = [ H H H H T T H H H T H T H H T H T ];
data = [ H H T T T T T T T T ];
% data = zeros(1,100);
% for i=1:20
	% data(i)=1;
% end;
successes = sum(data(:)==1);
N = length(data);
proportion = successes/N
theta = 0.4;
figure(1); clf; hold on;
%hypothesis = [0.2:0.01:0.96];
hypothesis = [0.1 0.5 0.8];
%uniform prior
prior = ones(1, length(hypothesis));
%prior = prior/(sum(prior));
prior(1,1) = 0.15;
prior(1,2) = 0.8;
prior(1,3) = 0.05;
%update rule
for (i = 1:N)
	for (j=1:length(hypothesis))
		likelihood(j) = binopdf(data(i),1,hypothesis(j));
	end;
	posterior = prior .* likelihood / (sum(prior .* likelihood));
	prior = posterior;
end;
posterior
plot(posterior);
peak_index = find(posterior == max(posterior));
hypothesis(peak_index)