clc;
close all;
clear all;
I=imread('circles.png');
a=im2bw(I);
[r c]=size(a);
acmp=a;
xo=zeros(r,c);
xo(74,39)=1;
b=strel('Disk',8);
 x2=imdilate(xo,b);
 x3=zeros(r,c);
 x4=zeros(r,c);
    for i=1:r-3
        for j=1:c-3
            if(x2(i,j)==acmp(i,j))
            x2(i,j)=acmp(i,j);
            else
                x2(i,j)=0;
            end
        
        end
    end
while(~isequal(xo,x2))
   xo=x2;
   x2=imdilate(xo,b);
    for i=1:r-3
        for j=1:c-3
            if(x2(i,j)==acmp(i,j))
            x2(i,j)=acmp(i,j);
            else
                x2(i,j)=0;
            end
        
        end
    end
end
x2=x2+a;
subplot(1,2,1)
imshow(a);
title('original');
subplot(1,2,2)
imshow(x2);
title('output');