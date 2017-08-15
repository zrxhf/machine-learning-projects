function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
		 output=sum(abs(truth-preds))/size(truth,2);
	case 'acc' 
		%% fill in code here
		 C=truth-preds; 
         [x,y]=find(C~=0);
         output=1-size(x,2)/size(truth,2);
end;

