function svmclassify=autosvm(xTr,yTr)
%	function svmclassify=autosvm(xTr,yTr)
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% 

% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
% Performs cross validation to train an SVM with optimal hyper-parameters on xTr,yTr
%load spiral
disp('Performing cross validation ...');
%xTr=mapminmax(xTr);
[bestC,bestP]=crossvalidate(xTr,yTr,'rbf',2.^[-1:8],2.^[-2:3]);
%[bestC,bestP]=crossvalidate4(xTr,yTr,'rbf',[1:10],[1:10]);


disp('Training SVM ...');
svmclassify=trainsvm(xTr,yTr,bestC,'rbf',bestP);
%trainerr=

