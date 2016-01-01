function [ histgram ] = histogramm( a )
[c d]=size(a);

t=1:256;
n=0:255;
count=0;

for z=1:256
    for i=1:c
        for j=1:d
            
            if a(i,j)==z-1
                count=count+1;
            end
        end
    end
            t(z)=count;
            count=0;
end
% disp(t')

histgram=figure,stem(n,t); 
grid on;
ylabel('no. of pixels with this intensity value');
xlabel('intensity values'); title('HISTOGRAM OF THE IMAGE')
figure,imshow(a);
end

