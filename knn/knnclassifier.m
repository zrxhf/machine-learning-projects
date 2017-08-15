function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
[d,n]=size(xTe);
[d,ntr]=size(xTr);
if k>ntr,k=ntr;end;

%currently assigning random predictions
un=unique(yTr);
preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here
if mod(k,2)==0
    k=k-1;
end

[indices,dists]=findknn(xTr,xTe,k)
clear temp
temp=yTr(indices);
if size(indices,2)==1 
    [a,b]=mode(temp',1);
 else [a,b]=mode(temp,1);
end 
 preds=a;




%for i=1:n
%  temp=yTr(indices(:,i));
%  a=tabulate(yTr(indices(:,i)));
%  dis=dists
  
%  [c,p]=max(a(:,2));
% if c
%  preds(i)=a(p,1);
%end
