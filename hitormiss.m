image=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 1 1 1 1 0 0 0 0 0 1 0 0 0;
       0 0 1 1 1 1 0 0 0 0 1 1 1 0 0;
       0 0 1 1 1 1 0 0 0 1 1 1 1 1 0;
       0 0 1 1 1 1 0 0 1 1 1 1 1 1 1;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0; 
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0; 
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];
[r c]=size(image);
D=[ 0 0 0 0 0 0 0;
    0 0 1 1 1 0 0; 
    0 0 1 1 1 0 0;
    0 0 0 0 0 0 0];
[rd cd]=size(D);
WminusD=zeros(rd+2,cd+2);
for i=2:rd+1
    for j=2:cd+1
        WminusD(i,j)=D(i-1,j-1);
    end
end

     x=0;y=0;

        AeroD = imerode(image,D);
        imagecomp=bitcmp(image,1);
        ero2=imerode(imagecomp,WminusD);
        figure;imshow(ero2);
        finalImg=AeroD+ero2;
        for i=2:r-1
            for j=2:c-1
                if([finalImg(i-1,j-1) finalImg(i-1,j) finalImg(i-1,j+1);
                    finalImg(i,j-1) finalImg(i,j) finalImg(i,j+1);
                    finalImg(i+1,j-1) finalImg(i+1,j) finalImg(i+1,j+1)]==[0 0 0
                    0 1 0
                    0 0 0])
                x=i;y=j;
                end
            end
        end
        for i=1:r
            for j=1:c
                if(i==x && j==y)
                    finalImg(i,j)=1;
                else
                    finalImg(i,j)=0;
                end
            end
        end
        subplot(1,3,1)
        imshow(image);
        title('image')
        subplot(1,3,2)
        imshow(WminusD);
        title('structure to find')
        subplot(1,3,3)
        imshow(finalImg);
        title('location of structure in image');