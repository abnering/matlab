clear;
clc;

figure(1); clf; hold on;
%figure(2); clf; hold on;
load T;
load pv21r -ASCII;
x =T(5450:5600);

%x=pv21r(1:400,2);
valve = pv21r(1:400,1);
Sx = [min(x)-0.5:0.01:max(x)+0.5];
%Sx = [21:0.01:23];
L = length(Sx);
Pr = ones(L);
Po=ones(L,L);
mean(x)

Pr = Pr/sum(Pr);
sigma = 0.2;
epsilon = 0.1;
% x(110:140)+epsilon
x = [x; x(90:150)+epsilon; x(40:100)+epsilon;];
x_peak=zeros(1,2);
Sx_mean = min(x);
for (i = 2:length(x)) %(min(x)-max(x))/pv101r(i,1)

  m=0*Pr;
  for (j = 1:length(Pr))
    me = Sx(j);
    m(j) = normpdf(x(i),me,sigma);
    m(j) = m(j) * Pr(j);
  end;
 
  Po = m/(sum(m));
    Pr=Po;
%   if ((valve(i) -  valve(i-1)) ~= 0)
%     Sx_mean = Sx_mean - 0.06*(valve(i) -  valve(i-1))
% 	Pr = normpdf(Sx, Sx_mean ,2);
%     %figure(3); clf; 
%     %plot(Sx,Pr);
%    % pause;
%   else
% 	Pr=Po;
%   end;
  figure(1);
  plot(1:i,x(1:i));
  %plot(1:i,valve(1:i), 'color','black');
  plot(5*(Po)+i, Sx,'color','green');
  peak = find(Po == max(Po));
  x_peak = [x_peak; [i, Sx(peak)]] ;
  plot(x_peak(2:end,1),x_peak(2:end,2), 'color','red'); %'LineWidth',4,
Sx(peak)
end;
hold off;
figure(2); clf; hold on;
movavg(x,3,20,1);
[Short,Long] = movavg(x,3,40,0);
[Short1,Long1] = movavg(x,3,40,1);
[Short2,Long2] = movavg(x,3,40,2);
[Short3,Long3] = movavg(x,3,40,0.5);
[Short4,Long4] = movavg(x,3,40,'e');
hold off;
hold off;
figure(3); clf; hold on;
    axis([40 2*150 22.2 22.5 ])
    plot(Long,'LineWidth',1.5,'color','black');
    plot(Long1,'LineWidth',1.5,'color','blue');
    plot(Long2,'LineWidth',1.5,'color','green');
    plot(Long3,'LineWidth',1.5,'color','magenta');
    plot(Long4,'LineWidth',1.5,'color','cyan');
    plot(x_peak(2:end,1),x_peak(2:end,2), 'LineWidth',2, 'color','red');
hold off;

% figure(4); clf; hold on;
% axis([20 150 0 0.1 ])
%     plot(abs(x_peak(1:end,2)-Long), 'color','red');
% hold off;