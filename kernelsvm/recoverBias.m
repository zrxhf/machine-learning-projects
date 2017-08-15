function bias=recoverBias(K,yTr,alphas,C)
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE 
%S=sign(alphas);

%bias=(yTr'*S-(yTr.*alphas)'*K*S)/sum(S);

 biasv=yTr-K'*(yTr.*alphas);
   [~,i]=min(abs(alphas-C/2));
   bias=biasv(i);
