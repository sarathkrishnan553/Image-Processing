
clc;
close all;
clear all;
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
bgImg = imread('lab_1.jpg');%Background Image
fgImg = imread('lab_2.jpg');%Foreground Image
bgImg=double(bgImg);
fgImg=double(fgImg);
% Divide images 
[r, c, ~]= size(bgImg);%r-rows,c-columns,p-planes
[x, y, ~] = size(fgImg);
figure;imshow(bgImg,[]);
figure;imshow(fgImg,[]);
%% divide bgImg into 4 blocks
A=bgImg(1:r/2,1:c/2,:);
B=bgImg(1:r/2,(c/2)+1:c,:);
C=bgImg(r/2+1:r,1:c/2,:);
D=bgImg(r/2+1:r,c/2+1:c,:);

size(bgImg)

E=fgImg(1:x/2,1:y/2,:);
F=fgImg(1:x/2,y/2+1:y,:);
G=fgImg(x/2+1:x,1:y/2,:);
H=fgImg(x/2+1:x,y/2+1:y,:);

c1=0;
r1=0;
c1=double(c1);
r1=double(r1);
c2=0;
r2=0;
c2=double(c2);
r2=double(r2);

for i=2:240
    for j=2:320
        c1=c1+sqrt((1/76800)*(bgImg(i,j,:)-bgImg(i-1,j,:))^2);
        r1=r1+sqrt((1/76800)*(bgImg(i,j)-bgImg(i,j-1))^2);
        sf=sqrt(c1^2+r1^2);
    end
end

for i=2:240
    for j=2:320
        c2=c2+sqrt((1/76800)*(fgImg(i,j,:)-fgImg(i-1,j,:))^2);
        r2=r2+sqrt((1/76800)*(fgImg(i,j)-fgImg(i,j-1))^2);
        sf1=sqrt(c2^2+r2^2);
    end
end
rImg=zeros(480,640);
for i=1:240
    for j=1:320
        if(sf>sf1)
            rImg(i,j)=bgImg(i,j);
        else
            rImg(i,j)=fgImg(i,j);
        end
    end
end
% figure;
% imshow(rImg,[]);

c3=0;
r3=0;
c3=double(c3);
r3=double(r3);
c4=0;
r4=0;
c4=double(c4);
r4=double(r4);



for i=240:480
    for j=2:320
        c3=c3+sqrt((1/76800)*(bgImg(i,j,:)-bgImg(i-1,j,:))^2);
        r3=r3+sqrt((1/76800)*(bgImg(i,j)-bgImg(i,j-1))^2);
        sf2=sqrt(c3^2+r3^2)
       
    end
end

for i=240:480
    for j=2:320
        c4=c4+sqrt((1/76800)*(fgImg(i,j,:)-fgImg(i-1,j,:))^2);
        r4=r4+sqrt((1/76800)*(fgImg(i,j)-fgImg(i,j-1))^2);
        sf3=sqrt(c4^2+r4^2);
    end
end
for i=240:480
    for j=1:320
        if(sf2>sf3)
            rImg(i,j)=bgImg(i,j);
        else
            rImg(i,j)=fgImg(i,j);
        end
    end
end
% figure;imshow(rImg,[]);
c5=0;
r5=0;
c5=double(c5);
r5=double(r5);
c6=0;
r6=0;
c6=double(c6);
r6=double(r6);



for i=2:240
    for j=320:640
        c5=c5+sqrt((1/76800)*(bgImg(i,j,:)-bgImg(i-1,j,:))^2);
        r5=r5+sqrt((1/76800)*(bgImg(i,j)-bgImg(i,j-1))^2);
        sf4=sqrt(c5^2+r5^2)
       
    end
end

for i=2:240
    for j=320:640
        c6=c6+sqrt((1/76800)*(fgImg(i,j,:)-fgImg(i-1,j,:))^2);
        r6=r6+sqrt((1/76800)*(fgImg(i,j)-fgImg(i,j-1))^2);
        sf5=sqrt(c6^2+r6^2);
    end
end
for i=1:240
    for j=320:640
        if(sf4>sf5)
            rImg(i,j)=bgImg(i,j);
        else
            rImg(i,j)=fgImg(i,j);
        end
    end
end
% figure;imshow(rImg,[]);

c7=0;
r7=0;
c7=double(c7);
r7=double(r7);
c8=0;
r8=0;
c8=double(c8);
r8=double(r8);



for i=240:480
    for j=320:640
        c7=c7+sqrt((1/76800)*(bgImg(i,j,:)-bgImg(i-1,j,:))^2);
        r7=r7+sqrt((1/76800)*(bgImg(i,j)-bgImg(i,j-1))^2);
        sf6=sqrt(c7^2+r7^2)
       
    end
end

for i=240:480
    for j=320:640
        c8=c8+sqrt((1/76800)*(fgImg(i,j,:)-fgImg(i-1,j,:))^2);
        r8=r8+sqrt((1/76800)*(fgImg(i,j)-fgImg(i,j-1))^2);
        sf7=sqrt(c8^2+r8^2);
    end
end
for i=240:480
    for j=320:640
        if(sf>sf7)
            rImg(i,j)=bgImg(i,j);
        else
            rImg(i,j)=fgImg(i,j);
        end
    end
end
figure;imshow(rImg,[]);

