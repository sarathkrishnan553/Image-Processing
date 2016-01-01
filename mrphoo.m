clc;
close all;
clear all;
A=imread('circles.png');
figure,imshow(A);
%Structuring element
B=getnhood(strel('disk',9));

m=floor(size(B,1)/2);
n=floor(size(B,2)/2);
%Pad array on all the sides
C=padarray(A,[m n],1);
%Intialize a matrix with size of matrix A
D=false(size(A));
E=false(size(A));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
       
        Temp=C(i:i+(2*m),j:j+(2*n));
       
        D(i,j)=min(min(Temp-B));E(i,j)=A(i,j)-D(i,j);
        
      
    end
end

figure,imshow(~E,[]);