function [ F_SP ] = medfiltt( a )

% I_G=double(rgb2gray(I));

IG_N=imnoise(a,'salt & pepper');

[r,c]=size(IG_N);

F_SP=zeros(r,c);

for i=2:r-1

    for j=2:c-1
        flt=[IG_N(i-1,j-1),IG_N(i-1,j),IG_N(i-1,j+1),IG_N(i,j-1),IG_N(i,j),IG_N(i,j+1),IG_N(i+1,j-1),IG_N(i+1,j),IG_N(i+1,j+1)];
F_SP(i,j)=median(flt);
    end
end
figure;imshow(IG_N,[]);
figure;imshow(F_SP,[]);
end

