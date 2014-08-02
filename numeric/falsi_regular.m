%find roots of f by dichotomy
% f is in C[a, b] and f(a)*f(b) < 0
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
if (fa*fb > 0)
    break;
end;
z = zeros(1,2);
for (i = 1:100)
    dx = fb*(b - a) / (fb - fa);
    c = b - dx;
    ac = c - a;
    x = c;
    fc = eval(f);
    z = [z; a, fa];
    z = [z; b , fb];
    if (fc == 0)
        break;
    end;
    if (fb*fc > 0)
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end;
    dx = min(abs(dx), ac);
end;
plot(z(2:end,1), z(2:end,2)); 

c
x = c;
fc = eval(f)
plot(c, fc, 'r.','markersize' ,6); 