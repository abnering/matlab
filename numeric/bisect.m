%find roots of f by dichotomy
% f is in C[a, b] and f(a)*f(b) < 0
clc;
x = -3:10;
a = 0;
b = 7;
f = 'x.^2 + 5*x - 20';
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
for (i = 1:10)
    c = (b + a) /2;
    x = c;
      z = [z; c, fc];
    fc = eval(f);   
  
    z = [z; c, fc];
     plot(c, eval(f),'r.','markersize' ,6);    
    if (fb*fc > 0)

        b = c;
        fb=fc;
    else
        a = c;
        fa=fc;
    end;

    
end;

plot(z(2:end,1), z(2:end,2)); 
