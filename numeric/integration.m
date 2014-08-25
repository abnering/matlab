clc; clear;
figure(1); clf; hold on;
N = 4;
e = exp(1);
x =0:0.25:1; %linspace(0,1,N);
f = '4./(1+x.^2)';
fn = eval(f);
plot(x,fn);
I = zeros(1,4);
%left Riemann sum
    I(1) = fn(1:end-1)*diff(x)';
%right Riemann sum
     I(2) = fn(2:end)*diff(x)';
%trapezoid
    I(3) = (fn(1:end-1) + 0.5*diff(fn))*diff(x)';
%simspon's
    h = (x(2) - x(1)) / 3;
    fn1 = fn(2:end-1);
    i = 1:length(fn1);
    I(4) =  h * (fn(1) + 4*sum(fn1( i(1:2:end))) + 2*sum(fn1( i(2:2:end))) +  fn(end));
 
    I