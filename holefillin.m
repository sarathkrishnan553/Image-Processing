% Copyright (C) <2016>  Sarath Krishnan
% This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <http://www.gnu.org/licenses/>.

clc;
close all;
clear all;
I=imread('holefi.png');
a=im2bw(I);
[r c]=size(a);
acmp=~a;
xo=zeros(r,c);
xo(74,39)=1;
b=strel('Disk',8);
 x2=imdilate(xo,b);
 x3=zeros(r,c);
 x4=zeros(r,c);
    for i=1:r-3
        for j=1:c-3
            if(x2(i,j)==acmp(i,j))
            x2(i,j)=acmp(i,j);
            else
                x2(i,j)=0;
            end
        
        end
    end
while(~isequal(xo,x2))
   xo=x2;
   x2=imdilate(xo,b);
    for i=1:r-3
        for j=1:c-3
            if(x2(i,j)==acmp(i,j))
            x2(i,j)=acmp(i,j);
            else
                x2(i,j)=0;
            end
        
        end
    end
end
x2=x2-a;
for i=1:r-3
        for j=1:c-3
            if x2(i,j)==1
                x3(i,j)=0;
            end
                if x2(i,j)==0
                   x3(i,j)=1;
                end
                if x2(i,j)==-1
                   x3(i,j)=1;
            end
        end
end
subplot(1,2,1)
imshow(a);
title('original');
subplot(1,2,2)
imshow(x3);
title('output');