function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here


[d,n]=size(xTr);
if nargin<4
    weights=ones(1,n)./n;
end
if nargin<3
    maxdepth=Inf;
end

T=zeros(6,1);
y1=ones(1,n).*yTr(1);
x1=repmat(xTr(:,1),1,n);
[feature,cut,Hbest]=entropysplit(xTr,yTr,weights);
if  x1==xTr
    ybar=mode(yTr);
    T=[ybar feature cut 0 0 0]';

elseif y1==yTr
    T=[yTr(1) feature cut 0 0 0]';
    
elseif maxdepth==1
    ybar=mode(yTr);
    T=[ybar feature cut 0 0 0]';
    
else

%[feature,cut,Hbest]=entropysplit(xTr,yTr,weights);
%xTr(feature,:)=zeros(1,n);
SL=xTr(:,find(xTr(feature,:)<=cut));
SR=xTr(:,find(xTr(feature,:)>cut));
yL=yTr(find(xTr(feature,:)<=cut));
yR=yTr(find(xTr(feature,:)>cut));
weightsL=weights(find(xTr(feature,:)<=cut));
weightsL=weightsL/sum(weightsL);
weightsR=weights(find(xTr(feature,:)>cut));
weightsR=weightsR/sum(weightsR);
TL=id3tree(SL,yL,maxdepth-1,weightsL);
TR=id3tree(SR,yR,maxdepth-1,weightsR);
[~,nL]=size(TL);
[~,nR]=size(TR);
%AL=[0 0 0 0 0 1]';
%shiftL=repmat(AL,1,nL);
%AR=[0 0 0 0 0 1+nL]';
%shiftR=repmat(AR,1,nR);
%%update the root index
TL(6,:)=TL(6,:)+1;
TR(6,:)=TR(6,:)+1;
if (nR>1)
TR(6,2:nR)=TR(6,2:nR)+nL;
end

%%update the subtree index
notleafL=(TL(4,:)~=0);
notleafR=(TR(4,:)~=0);

ShiftL=notleafL.*1;
ShiftR=notleafR.*(nL+1);

TL(4,:)=TL(4,:)+ShiftL;
TL(5,:)=TL(5,:)+ShiftL;

TR(4,:)=TR(4,:)+ShiftR;
TR(5,:)=TR(5,:)+ShiftR;


%%Combine the tree
Root=[mode(yTr) feature cut 2 2+nL 0]';
T=horzcat(Root, TL, TR);
end





