%dx/dt = cos(t) + sin(x);
clc; clear;
N = 18;
t = linspace(0,pi,N);
x=zeros(1,N);

for (i=2:N)
    x(i) = x(i-1) + (pi/(N))*(cos(t(i-1)) + sin(x(i-1)));
end;

x(end)
