function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
A=diag(yTr)*(xTr'*w);
B=ones(n,1)-A;
sel=(sign(B)+1)/2;
loss=sum(sel'*B)+lambda*w'*w;
gradient=-xTr*(diag(sel)*yTr')+2*lambda*w;
