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
C1=padarray(A,[m n],1);
%Intialize a matrix with size of matrix A
D1=zeros(size(A));
for i=1:size(C1,1)-(2*m)
    for j=1:size(C1,2)-(2*n)
       
        Temp1=C1(i:i+(2*m),j:j+(2*n));
       
        D1(i,j)=min(min(D(i,j)-B));
      
    end
end
F=imclose(A,se);
subplot(1,3,1);imshow(A);title('original image');
subplot(1,3,2);imshow(~D1);title('closing without inbuilt function');
subplot(1,3,3);imshow(F);title('closing with inbuilt function');