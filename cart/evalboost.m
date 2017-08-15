function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

nt=length(BDT);
alpha=BDT{nt};
[~,n]=size(xTe);

for i=1:nt-1
T=BDT{i};
predict(i,:)=evaltree(T,xTe);
end
preds=mode(predict);

%%find the label with maximum weights
%for i=1:n
%    C=unique(predict(:,i));
%    k=size(C);
%    for j=1:k
%        cout(:,j)=(predict(:,i)==(ones(nt-1,1)*C(j)));
%    end
%    weight=alpha*cout;
%    [weightmax,weightindex]=max(weight);
%    preds(i)=C(weightindex);
%end

