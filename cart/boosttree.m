function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here
if nargin<4
    maxdepth=Inf;
end

if nargin<3
    nt=100;
end

[d,n]=size(x);

BDT=cell(nt,1);

F=forest(x,y,nt);


alphat=zeros(1,nt);
w=ones(1,n)./n;

for i=1:nt
T=F{i};
predict(i,:)=evaltree(T,x);
err(i,:)=(predict(i,:)~=y);
end

for i=1:nt
    epsl=err*w';
    [minerr,ht]=min(epsl);
    if minerr>0.5
        break;
    end
%    alphatemp=0;
%    if minerr>0
    alphatemp=1/2*log((1-minerr)/minerr);
%    end
    alphat(ht)=alphat(ht)+alphatemp;
    w=w.*exp(-alphatemp.*predict(ht,:).*y)./2./(minerr*(1-minerr));
    w=w/sum(w);
end

for i=1:nt
    T=F{i};
 %   T(1,:)=T(1,:)*alphat(i);
    BDT{i}=T;
end
BDT{nt+1}=alphat;
    
    
