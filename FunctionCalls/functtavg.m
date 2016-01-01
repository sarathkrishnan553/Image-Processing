function [ anz ] = functtavg( a,h )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

an=imnoise(a,'salt & pepper');
[m,n]=size(an);
a=m;
b=n;
figure, imshow(uint8(an));
% [p,q]=size(z);
e=2:(m-1);
f=2:(n-1);
anz=zeros(m,n);
for k=2:m-1
    for j=2:n-1
        for c=-1:1
            for d=-1:1
        anz(j,k)=anz(j,k)+an(j-c,k-d)*h(d+2,c+2);
    end
        end
    end
end
imshow(anz,[]);
end

