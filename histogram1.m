clc;
close all;
clear all;
x=imread('pout.tif');

[c d]=size(x);

t=1:256;
n=0:255;
count=0;

for z=1:256
    for i=1:c
        for j=1:d
            
            if x(i,j)==z-1
                count=count+1;
            end
        end
    end
            t(z)=count;
            count=0;
end
% disp(t')

histgram=stem(n,t); 
grid on;
ylabel('no. of pixels with intensity levels---->');
xlabel('intensity levels---->'); title('HISTOGRAM OF THE IMAGE')