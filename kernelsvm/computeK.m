function K = computeK(kernel_type,X,Z,param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxm);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if nargin<4,
    param=Z;
	Z=X;
end;

switch kernel_type
    case 'linear'
        K=X'*Z;
    case 'rbf'
        K=exp((-param)*l2distance(X,Z));     
    case 'poly'
        K=(abs(X'*Z+1)).^param;
    otherwise
        disp('Kernel type is not recognized, K is not computed.');
end
        
%%YOUR CODE HERE
