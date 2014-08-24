clear;
clc;
import_building;
X = [VarName1 VarName2];
plot(X(:,1),X(:,2), 'b.','markersize',2);
Y = pdist(X);
Z = linkage(Y);
dendrogram(Z);