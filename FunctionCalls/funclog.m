function [ b ] = funclog( a )
a=im2double(a);
[m n]=size(a);
% g=input('enter gama value:');
for i=1:m
    for j=1:n
b(i,j)=2*log(1+a(i,j));
    end
end
imshow(b);
end

