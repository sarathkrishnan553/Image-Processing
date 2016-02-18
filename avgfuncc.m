function [ c ] = avgfuncc( a )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[r s]=size(a);
m1=input('enter the mask size(m x m):');
h=ones(m1,m1);
temp=0;
for m=1:m1
    for n=1:m1
        temp=temp+h(m1,m1);
    end
end
q=h/temp;
disp(temp);
c=zeros(r,s);
for i=2:(r-1)
    for j=2:(s-1)
        for k=-1:1  
            for l=-1:1 
                c(i,j)=c(i,j)+(a(i-k,j-l)*q(l+2,k+2));
            end
        end
    end
end
imshow(c,[]);
end

