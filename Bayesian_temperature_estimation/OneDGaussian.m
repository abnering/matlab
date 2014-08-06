clear;
clc;
figure(1); clf; hold on;
load T;
x =T(5550:5600);
Sx = [20:0.01:35];
L = length(Sx);
Pr = ones(L);
Po=ones(L,L);
mean(x)
Pr = Pr/sum(Pr);
Po = Po/sum(Po);
sigma = 0.2;%std(x);
x_peak=zeros(1,2);
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
  plot(1:i,x(1:i));
  plot(i*(Po)+i, Sx,'color','green');
  %drawnow
  peak = find(Po == max(Po));
  %plot(Sx(peak),0:0.001:1, 'r.','markersize',1);
  x_peak = [x_peak; i, Sx(peak)] ;
  %plot([0,i], [Sx(peak),Sx(peak)], 'color','red');
  plot(x_peak(2:end,1),x_peak(2:end,2), 'color','red');
Sx(peak)
%pause;
end;
