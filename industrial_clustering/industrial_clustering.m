clear;
clc;
import_building;
X = [VarName1 VarName2];
%X= load("Temperature.txt" );
 figure(1); clf; hold on;
 plot(X(:,1),X(:,2), 'bo','markersize',4);
% Y = pdist(X);
% Z = linkage(Y);
% dendrogram(Z);
% hold off;
% 
% 
% 
% options = statset('Display','final');
% gm = fitgmdist(X,2,'Options',options);
% 
% figure(2); clf; hold on;
% scatter(X(:,1),X(:,2),10,'ko');
% 
% ezcontour(@(x,y)pdf(gm,[x y]),[-8 50],[-8 35]);
% hold off


%eva = evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:20])


% idx = cluster(gm,X);
% idx = kmeans(X,5,'distance','city');
% 
% cluster1 = (idx == 1);
% cluster2 = (idx == 2);
% cluster3 = (idx == 3);
% cluster4 = (idx == 4);
% cluster5 = (idx == 5);
% figure(3); clf; hold on;
% 
% scatter(X(cluster1,1),X(cluster1,2),10,'r+');
% hold on
% scatter(X(cluster2,1),X(cluster2,2),10,'bo');
%  scatter(X(cluster3,1),X(cluster3,2),10,'go');
%  scatter(X(cluster4,1),X(cluster4,2),10,'yo');
%  scatter(X(cluster5,1),X(cluster5,2),10,'ko');
% hold off
% legend('Cluster 1','Cluster 2','Location','NW')


% P = posterior(gm,X);
% 
% scatter(X(cluster1,1),X(cluster1,2),10,P(cluster1,1),'+')
% hold on
% scatter(X(cluster2,1),X(cluster2,2),10,P(cluster2,1),'o')
% hold off
% legend('Cluster 1','Cluster 2','Location','NW')
% clrmap = jet(80); colormap(clrmap(9:72,:))
% ylabel(colorbar,'Component 1 Posterior Probability')


