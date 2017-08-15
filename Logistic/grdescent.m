function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%


if nargin<5,tolerance=1e-02;end;
 [loss,gradient ]=func(w0);
 lossold=loss;
 
for i=1:maxiter
   
  [lossnew,gradient ]=func(w0);
   if norm(gradient)<tolerance break
   else
       if (lossnew>lossold)
           stepsize=stepsize*0.1;
                  else 
             stepsize=stepsize*2;
       end
       w0=w0-stepsize*gradient;
   
   end
    lossold=lossnew;
    
end
w=w0;
