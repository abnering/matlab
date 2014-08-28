clear;
clc;

X = load('Temperature.csv');
RT = load('Random_Temperature.csv');
F = X(end-2000:end);
X = X(1:end-2000);
%X = [ 4 5 3 4 5 2 5];
U = unique(X);

C = zeros(length(U),length(U));

%transition matrix
for(i=2:length(X))
    j = find(X(i)==U);
    k = find(X(i-1)==U);
    C(j,k) = C(j,k) + 1; 

    
end;

    
    %normalize
    for(m=1:length(C))
        %C(i,:) = C(i,:) / sum(C(i,:));
        C(:,m) = C(:,m) / sum(C(:,m));
    end;

%predict

Y = zeros(1, length(X));
Start = 1;
End = 2000;
Future = F;
Y(Start) = Future(Start);
figure(2); clf; hold on;
for(i=Start+1:End)
 j = find(Future(i-1)==U);
 
 for(k=i:i+30)
     Y(k) = randsample(U,1,true,C(:,j));
 end;
 [Short4,Long4] = movavg(Y,3,40,'e');
     plot(Future(Start:i-1),'.-');
    plot(i-1:k,Y(i-1:k),'--','color','red');
    plot(i,Y(i),'r.');
     plot(i-1:k,Future(i-1:k),'-.','color','blue');
    pause
    plot(i-1:k,Y(i-1:k),'color','white');
   % plot(1:i,Y(1:i),'color','red');
    plot(i-1:k,Future(i-1:k),'.-','color','white');
 %axis([Start End min(Future(Start:End)) max(Future(Start:End))])
%  plot(i-1,Future(i-1),'b.');
%  plot(i,Y(i),'r.');

end;
hold off;
figure(1); clf;hold on;
    axis([Start End min(Future(Start:End)) max(Future(Start:End))])
    plot(Future(Start:End));
    plot(Long4(Start:End),'color','red');
hold off;


 save('transition_matrix','C','-ascii');