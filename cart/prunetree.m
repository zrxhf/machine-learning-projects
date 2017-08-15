function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here

[d,n]=size(xTe);
leave=find(T(4,:)== 0);
error=sum(evaltree(T,xTe)-y);
for i=leave
    parent=T(6,i);
    if (parent>0)
       T2=T;
       T2(4,parent)=0;   T2(5,parent)=0;
       error2=sum(evaltree(T2,xTe)-y);
       if(error2<error)
           T=T2; error=error2;
       end
    end
end
 
end
