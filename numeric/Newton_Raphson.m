%f(x)=0
clc;
x = 0:20;
a = 10;
b = 1;
%f = 'x.^2 + 5*x - 20';
f = 'log(x) - 2';
figure(1); clf; hold on;
plot (x, eval(f));
x = a;
fa = eval(f);
x = b;
fb = eval(f);