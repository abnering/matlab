s = 5; %true state
%figure(2); clf; hold on;
figure(1); clf; hold on;
h = plot(s,1,'r.');
set(h,'markersize',40,'linewidth', 3);
x = s + randn(1,100);
h = plot(x,1,'r.','markersize',10);
Sx = [4:0.1:10];
L = length(Sx);
Pr = ones(L);
Po=ones(L,L);
mean(x)
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
  %figure(2);clf;
  %plot(Sx, m);
  %pause;
  Po = m/(sum(m));
  figure(1);
  plot(Sx,Po);
  %drawnow
  peak = find(Po == max(Po));
end;
plot(Sx(peak),0:0.001:1, 'r.','markersize',1);
Sx(peak)