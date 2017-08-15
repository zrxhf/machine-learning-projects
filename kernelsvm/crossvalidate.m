function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
K=5;

Indices = crossvalind('Kfold', size(xTr,2), K);
n=size(xTr,2);

[cn]=size(Cs,2);
[pn]=size(paras,2);
vali_error=zeros(cn,pn);

for i=1:cn
    for j=1:pn
       
        for q=1: K
           Test = (Indices == q); Train = ~Test;
        
         svmclassify=trainsvm(xTr(:,Train),yTr(Train),Cs(i),ktype,paras(j));
         vali_error(i,j)=vali_error(i,j)+mean(sign(svmclassify(xTr(:,Test)))~=yTr(Test)');
        end
         vali_error(i,j)= vali_error(i,j)/K;
    end
end
 


[index1,index2]=find(vali_error == min(min(vali_error)));
index1=index1(1,:);
index2=index2(1,:);
bestC=Cs(index1);
bestP=paras(index2);
bestval=vali_error(index1,index2);
allvalerrs=vali_error;
end

