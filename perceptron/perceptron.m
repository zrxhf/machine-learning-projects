function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);

%% fill in code here
Miter=0;
while (Miter<=1000)&&(size(find(sign(w'*x)~=y),2)~=0)
  Miter=Miter+1;
    a=randperm(n);
    xx=x(:,a); 
    yy=y(a);
  for i=1:n
      
      if sign(w'*xx(:,i))~=yy(i)
           
          w = perceptronUpdate(xx(:,i),yy(i),w);
      end
    end
    
       
end

