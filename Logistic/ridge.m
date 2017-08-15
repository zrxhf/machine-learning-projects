function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
loss=0;
gradient=zeros(d,1);
gradient=2*xTr*xTr'*w-2*xTr*yTr'+2*lambda*w;
loss=trace(w'*xTr*xTr'*w-w'*xTr*yTr'-yTr*xTr'*w+yTr*yTr'+lambda*w'*w);
