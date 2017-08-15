function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here
[d,n]=size(x);
F=cell(nt,1);
for i=1:nt
    index=randi(n,1,n);
    xTr=x(:,index);
    yTr=y(index);
    T=id3tree(xTr,yTr);
 %   T=prunetree(T,x,y);
    F{i}=T;
end
    