%dx/dt = cos(t) + sin(x);
clc; clear;
N = 18;
t = linspace(0,pi,N);
x=zeros(1,N);

for (i=2:N)
    x(i) = x(i-1) + (pi/(N))*(cos(t(i-1)) + sin(x(i-1)));
end;

x(end);

y = zeros(1,1e+6);
y(1)=1;
dt = 0.5;
for(i=1:length(y) - 1)
    y(i+1) = y(i) + dt * 2*y(i);
    a = y(i+1);
    if (a>1e+5)
        
        break;
    end;
    
end;
E = exp(1*i) - a
i