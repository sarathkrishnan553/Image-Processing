clc;
close all;
clear all;
A=imread('text.png');
Z=~(A);
se=strel('line',4,90);
%Structuring element
B=getnhood(strel('line',4,90));
B1=getnhood(strel('Disk',6));

m=floor(size(B,1)/2);
n=floor(size(B,2)/2);
%Pad array on all the sides
C=padarray(A,[m n],1);
C1=padarray(Z,[m n],1);
%Intialize a matrix with size of matrix A
D=zeros(size(A));
D1=zeros(size(A));
D2=zeros(size(A));
% for i=1:size(C,1)-(2*m)
%     for j=1:size(C,2)-(2*n)
%        
%         Temp=C(i:i+(2*m),j:j+(2*n));
%        
%         D(i,j)=min(min(Temp-B));
%       
%     end
% end
% for i=1:size(C1,1)-(2*m)
%     for j=1:size(C1,2)-(2*n)
%        
%         Temp=C1(i:i+(2*m),j:j+(2*n));
%        
%         D1(i,j)=min(min(Z(i,j)-B1));
%         D2(i,j)=D1(i,j)+D2(i,j);
%       
%     end
% end
D2=(imerode(A,B)&imerode(Z,B1));
subplot(1,3,1);imshow(A);title('original image');
% subplot(1,3,2);imshow(F);title('imerode using inbuilt function');
subplot(1,3,3);imshow(D2,[]);title('imerode without using inbuilt function');