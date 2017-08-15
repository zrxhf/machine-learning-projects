function [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr,C,ktype,kpar)
% function [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr, C,ktype,kpar);
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% C   : regularization constant (in front of loss)
% ktype : (linear, rbf, polynomial)
% 
% Output:
% svmclassify : a classifier (svmclassify(xTe) returns the predictions on xTe)
% sv_i : indices of support vecdtors
% alphas : a nx1 vector of alpha values
%
% Trains an SVM classifier with kernel (ktype) and parameters (C,kpar)
% on the data set (xTr,yTr)
%

if nargin<5,kpar=1;end;
yTr=yTr(:);
svmclassify=@(xTe) (rand(1,size(xTe,2))>0.5).*2-1; %% classify everything randomly
n=length(yTr);



disp('Generating Kernel ...')
% 
% YOUR CODE
K = computeK(ktype, xTr, xTr,kpar);
%
disp('Solving QP ...')
%
% YOUR CODE 
[H,f,Aeq,beq,lb,ub]=generateQP(K,yTr',C);
%A0=zeros(1,n);
%b0=1;
A0=Aeq.*0;
b0=beq.*0;
alphas=quadprog(H,f,A0,b0,Aeq,beq,lb,ub);
%index1(1:n,1)=1:n;
%S=sign(alphas);
%sv_i=S.*index1;
%
disp('Recovering bias')
%
% YOUR CODE 
bias=recoverBias(K,yTr,alphas,C);
%
disp('Extracting support vectors ...')
%
% YOUR CODE 
%w=xTr*(alphas.*yTr);

%
disp('Creating classifier ...')
%
% YOUR CODE
%svmclassify=@(xTe) (sign(w'*xTe+bias))';
sv_i=find(alphas>1e-5 & alphas<C);
svmclassify=@(xTe) ((yTr.*alphas)'*computeK(ktype,xTe,xTr,kpar)')'+bias;

%svmclassify=@(xTe) (computeK(ktype,xTe,xTr,kpar)*(alphas.*yTr)+bias);
%
disp('Computing training error:') % this is optional, but interesting to see
%
% YOUR CODE 
%trainerr=sum(svmclassify(xTr)~=yTr(:))/length(yTr)

%


