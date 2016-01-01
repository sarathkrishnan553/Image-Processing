clc;
close all;
clear all;
A=imread('text.png');
se=strel('disk',2);
F=imdilate(A,se);
B=getnhood(strel('disk',2));
m=floor(size(B,1)/2);
n=floor(size(B,2)/2);
%Pad array on all the sides
C=padarray(A,[m n]);
D=zeros(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        D(i,j)=max(max(Temp&B));
    end
end
subplot(1,3,1);imshow(A);title('original image');
subplot(1,3,2);imshow(D);title('imdilate without using inbuilt function');
subplot(1,3,3);imshow(F);title('imdilate using inbuilt function');