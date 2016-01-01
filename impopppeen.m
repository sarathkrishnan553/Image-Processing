clc;
close all;
clear all;
A=imread('text.png');
se=strel('line',4,90);
%Structuring element
B=getnhood(strel('line',4,90));

m=floor(size(B,1)/2);
n=floor(size(B,2)/2);
%Pad array on all the sides
C=padarray(A,[m n],1);
%Intialize a matrix with size of matrix A
D=zeros(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
       
        Temp=C(i:i+(2*m),j:j+(2*n));
       
        D(i,j)=min(min(Temp-B));
      
    end
end
C1=padarray(A,[m n]);
D1=zeros(size(A));
D2=zeros(size(A));
for i=1:size(C1,1)-(2*m)
    for j=1:size(C1,2)-(2*n)
        Temp=C1(i:i+(2*m),j:j+(2*n));
        D1(i,j)=max(max(D(i,j)&B));
    end
end
F=imopen(A,se);
subplot(1,3,1);imshow(A);title('original image');
subplot(1,3,2);imshow(~D1);title('opening without inbuilt function');
subplot(1,3,3);imshow(F);title('opening with inbuilt function');