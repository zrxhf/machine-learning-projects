function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    Z=X;
    
   
%else  % case when there are two inputs (X,Z)
	%% fill in code here
end
%
%%extract the size of X and Z
Xc=size(X,2);
Zc=size(Z,2);

X2=dot(X,X);
%IX2=ones(1,Zc);
Z2=dot(Z,Z);
%IZ2=ones(Xc,1);

%S=X2'*IX2;
%R=IZ2*Z2;
S=repmat(X2',1,Zc);
R=repmat(Z2,Xc,1);


D=S-2*X'*Z+R;
%D=sqrt(abs(D));










