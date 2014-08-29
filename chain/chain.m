clear;
clc;

%X = load('Temperature.csv');
X10 = load('Temperature10csv');
X11 = load('Temperature11csv');
X12 = load('Temperature12csv');
X13 = load('Temperature13csv');
X14 = load('Temperature14csv');
X15 = load('Temperature15csv');
X16 = load('Temperature16csv');

X17 = load('Temperature17csv');
% X18 = load('Temperature18csv');
% X19 = load('Temperature19csv');
% X20 = load('Temperature20csv');
% X21 = load('Temperature21csv');
% X22 = load('Temperature22csv');
% X23 = load('Temperature23csv');
%X = [X10; X11; X12; X13; X14; X15; X16; X17; X18; X19; X20; X21; X22; X23];
%X = [X17; X18; X19; X20; X21; X22; X23];
X = [X10; X11; X12; X13; X14; X15; X16];
F = X17;%X(end-2000:end);
X = X(1:end-2000);
%X = [ 4 5 3 4 5 2 5];
U = unique(X);

% C = zeros(length(U),length(U));
% 
% %transition matrix
% for(i=2:length(X))
%     j = find(X(i)==U);
%     k = find(X(i-1)==U);
%     C(j,k) = C(j,k) + 1;   
% end;
% 
% %normalize
% for(m=1:length(C))
%     %C(i,:) = C(i,:) / sum(C(i,:));
%     C(:,m) = C(:,m) / sum(C(:,m));
% end;
% 
% save('transition_matrix','C','-ascii');

C = load('transition_matrix');

%predict
Y = zeros(1, length(X));
Start = 1;
End = 500;
Future = F;
Y(Start) = Future(Start);
figure(2); clf; hold on;
for(i=Start+1:End)
 j = find(Future(i-1)==U);
 for(k=i:i+30)
     Y(k) = randsample(U,1,true,C(:,j));
 end;
 [Short4,Long4] = movavg(Y,3,40,'e');
  %axis([Start k min(Y(i-1:k)) max(Y(i-1:k))])
  plot(Future(Start:i-1),'.-');
  plot(i-1:k,Y(i-1:k),'--','color','red');
  plot(i,Y(i),'r.','markersize', 8);
  plot(Y(Start:i),'color','red');
  plot(i-1:k,Future(i-1:k),'-.','color','blue');
  %drawnow();
 pause
  plot(i-1:k,Y(i-1:k),'color','white');
   % plot(1:i,Y(1:i),'color','red');
  plot(i-1:k,Future(i-1:k),'.-','color','white');
 %axis([Start End axis([Start End min(Future(Start:End)) max(Future(Start:End))]) min(Future(Start:End)) max(Future(Start:End))])
%  plot(i-1,Future(i-1),'b.');
%  plot(i,Y(i),'r.');

end;
hold off;
figure(1); clf;hold on;
    axis([Start End min(Future(Start:End)) max(Future(Start:End))])
    plot(Future(Start:End));
    plot(Long4(Start:End),'color','red');
hold off;


