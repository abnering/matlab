%least squares from Gaussian prospective
 clear;
 clc;
sigma = 2;
save('sigma');
%f = '10*x - 2';
x = 1:20;
fe = fun(x)';%eval(f)';
fe = fe + sigma.*randn(length(fe),1);
save('fe');
init = [-5,-5];
[theta,fmin] = fminunc(@objfun,init);
disp(theta);
figure(1); clf; hold on;
	plot(x,fe,'r.','markersize', 6);
	plot(x, theta(1)*x+theta(2)); 
	for (i=1:length(x))
		mu = theta(1)*x(i)+theta(2);
		interval = (mu-100):(mu+100);
		p = normpdf(interval,mu,sigma);
		plot (x(i)+p,interval, 'g--');
	end;
	
hold off;