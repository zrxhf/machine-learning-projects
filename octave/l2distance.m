function D=l2distance(X,Z)
%X=[0,0,0;0,0,2]';
%Z=[1,0,0;1,1,1;1,1,0]';
%X=[0,0,0]';
%Z=[1,0,0;1,1,1;1,1,0]';



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
    D=l2distance(X,X);
else  % case when there are two inputs (X,Z)
	%% fill in code here
   ax=size(X,2);
az=size(Z,2);
    S=X'*X;
   XX=diag(S)';
   S=repmat(XX',1,az);
   R=Z'*Z;
   ZZ=diag(R)'
   R=repmat(ZZ,ax,1);
   XZ=X'*Z;  
   D=S-2*XZ+R;
   D=sqrt(abs(D));
   %
end;
%



