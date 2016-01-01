function [ sum ] = funcintensity( a )
[b c]=size(a);
a=uint8(a);
figure,imshow(a);
% image=a(:,:,1);
for i=1:b
    for j=1:c
        if a(i,j)>=180 && a(i,j)<=190
         sum(i,j)=0;
        else
            sum(i,j)=a(i,j);
        end
    end
end
figure,imshow(sum);

end

