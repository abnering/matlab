clear;
clc;
figure(1); clf; hold on;
%figure(2); clf; hold on;
load T;
load pv21r;
x =T(5450:5500);
x=pv21r(1:300,2);
valve = pv21r(1:300,1);
Sx = [min(x):0.01:max(x)];
L = length(Sx);
Pr = ones(L);
Po=ones(L,L);
mean(x)
Pr = Pr/sum(Pr);
sigma = 0.2;%std(x);
x_peak=zeros(1,2);
for (i = 2:length(x)) %(min(x)-max(x))/pv101r(i,1)

  m=0*Pr;
  for (j = 1:length(Pr))
    me = Sx(j);
    m(j) = normpdf(x(i),me,sigma);
    m(j) = m(j) * Pr(j);
  end;
  
  Po = m/(sum(m));
   % Pr=Po;
  if ((valve(i) -  valve(i-1)) != 0)
	Pr = normpdf(Sx,min(x) - 4*(valve(i) -  valve(i-1))  ,2);
  else
	Pr=Po;
  end;
  figure(1);
  plot(1:i,x(1:i));
  %plot(1:i,valve(1:i), 'color','black');
  plot(5*(Po)+i, Sx,'color','green');
  peak = find(Po == max(Po));
  x_peak = [x_peak; [i, Sx(peak)]] ;
  plot(x_peak(2:end,1),x_peak(2:end,2), 'color','red');
Sx(peak);
end;
hold off;
figure(2); clf; hold on;
movavg(x,3,20,1);
hold off;
hold off;