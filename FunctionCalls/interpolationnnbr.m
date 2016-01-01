function [ d ] = interpolationnnbr( a )
[m,n]=size(a);
xnew=512;
ynew=512;
xscae=xnew./(m-1);
yscae=ynew./(n-1);
c=zeros(xnew,ynew);
for j=0:(xnew-1)
    for k=0:(ynew-1)
        c(j+1,k+1)=a(1+round(j./xscae),1+round(k./yscae));
    end
end
figure,d=imshow(c,[]);
figure,e=imshow(a);
 
end

