function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%


%% fill in code here
[pos,neg] = naivebayesPY(x,y)
[posprob,negprob] = naivebayesPXY(x,y)
w=log(posprob)-log(negprob);
b=log(pos/neg)
end


function w = perceptronUpdate(x,y,w)
% function w=perceptronUpdate(x,y,w);
%
% Implementation of Perceptron weights updating
% Input:
% x : input vector of d dimensions (dx1)
% y : corresponding label (-1 or +1)
% w : weight vector before updating
%
% Output:
% w : weight vector after updating
%

d = size(x,1);
%% fill in code here
w=w+y*x;
end




