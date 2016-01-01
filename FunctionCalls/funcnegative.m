function [ c ] = funcnegative( a )

% a=im2double(a);
[m n]=size(a);
b=zeros(m,n);
% g=input('enter gama value:');
for i=1:m
    for j=1:n
b(i,j)=255-a(i,j);
    end
end
figure,imshow(a);
c=imshow(b,[]);

end

