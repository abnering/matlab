function f = objfun(theta)
load('fe');
load('sigma');
a = 0.5*sigma^(-2);
x = 1:20;
y = (theta(1)*x + theta(2));
f = a*sum((fe - y').^2);