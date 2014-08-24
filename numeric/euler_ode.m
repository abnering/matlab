%dx/dt = cos(t) + sin(x);
clc; clear;
N = 18;
t = linspace(0,pi,N);
x=zeros(1,N);

for (i=2:N)
    x(i) = x(i-1) + (pi/(N))*(cos(t(i-1)) + sin(x(i-1)));
end;

x(end);

x=zeros(1,3);
x(1) = 3;
t = 0:0.1:4;
for (i=2:4)
    x(i) = x(i-1) + (0.1)*(t(i-1) - 2*x(i-1))
end;

x(end);