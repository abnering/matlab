s = 5; %true state
h = plot(s,1,'r.');
set(h,'markersize',40,'linewidth', 3);
x = s + randn(1,50);
hold on;
h = plot(x,1,'r.','markersize',10);
Sx = [4:0.1:6];
L = length(Sx)
Pr = ones(L);
Po=ones(L,L);

Pr = Pr/sum(Pr);
Po = Po/sum(Po);
sigma = std(x);
for (i = 2:length(x))
  Pr=Po;
  m=0*Pr;
  for (j = 1:length(Pr))
    me = Sx(j);
    m(j) = normpdf(x(i),me,sigma);%(1/( sigma* sqrt(2*pi) ) )*exp( -(x(i) - me) / (2*sigma^2) );
    m(j) = m(j) * Pr(j);
  end;
  Po = m/(sum(m));
  plot(Sx,Po);
  peak = find(Po == max(Po));
end;
