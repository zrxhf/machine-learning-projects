function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

nt=length(F);

for i=1:nt
T=F{i};
predict(i,:)=evaltree(T,xTe);
end
preds=mode(predict,1);

