function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here

[d,n]=size(xTe);

for i=1:n
    index=1;
    while ((T(4,index))~=0)
        if (xTe(T(2,index),i)<=T(3,index))
            index=T(4,index);
        else
            index=T(5,index);
        end
    end
    
    ypredict(i)=T(1,index);
end