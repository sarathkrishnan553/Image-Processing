clc;
close all;
clear all;
img11 = imread('ny_1.jpg');
original=img11;
% Convert indexed image to true-color (RGB) format
% RGB = ind2rgb(X,MAP);
RGB=img11;
figure,imshow(RGB);
% Convert image to L*a*b* color space
cform2lab = makecform('srgb2lab');
LAB = applycform(RGB, cform2lab); 
figure,imshow(LAB,[]);
L = LAB(:,:,1)/100;
L1= LAB(:,:,2)/100;
L2= LAB(:,:,3)/100;
LAB(:,:,1) = adapthisteq(L,'NumTiles',...
                         [8 8],'ClipLimit',0.001)*100;
LAB(:,:,2) = adapthisteq(L1,'NumTiles',...
                         [8 8],'ClipLimit',0.001)*100;
LAB(:,:,3) = adapthisteq(L2,'NumTiles',...
                         [8 8],'ClipLimit',0.005)*100;
                     
cform2srgb = makecform('lab2srgb');
im2 = applycform(LAB, cform2srgb);
figure,imshow(im2,[]);
% im2=LAB(:,:,1);
[height, width, ~] = size(im2);

patchSize = 15; %the patch size is set to be 15 x 15
padSize = 7; % half the patch size to pad the image with for the array to 
%work (be centered at 1,1 as well as at height,1 and 1,width and height,width etc)

JDark = zeros(height, width); % the dark channel
imJ = padarray(im2, [padSize padSize], Inf); % the new image
% imagesc(imJ); colormap gray; axis off image

for j = 1:height
    for i = 1:width
        % the patch has top left corner at (jj, ii)
        patch = imJ(j:(j+patchSize-1), i:(i+patchSize-1),:);
        % the dark channel for a patch is the minimum value for all
        % channels for that patch
        JDark(j,i) = min(patch(:));
%         JDark(j,i)=JDark(j,i)+100;
     end
end


% atm
[height, width, ~] = size(img11);
imsize = width * height;

numpx = floor(imsize/1000); % accomodate for small images
JDarkVec = reshape(JDark,imsize,1); % a vector of pixels in JDark
ImVec = reshape(img11,imsize,3);  % a vector of pixels in my image

[JDarkVec, indices] = sort(JDarkVec); %sort
indices = indices(imsize-numpx+1:end); % need the last few pixels because those are closest to 1

atmSum = zeros(1,3);
atmSum=double(atmSum);
ImVec=double(ImVec);
for ind = 1:numpx
    atmSum = atmSum + ImVec(indices(ind),:);
end

A = atmSum / numpx;
% JDark = darkChannel(im);
omega = 0.95; % the amount of haze we're keeping

im3 = zeros(size(img11));
for ind = 1:3 
    im3(:,:,ind) = img11(:,:,ind)./A(ind);
end

% imagesc(im3./(max(max(max(im3))))); colormap gray; axis off image

transmission = 1-omega*darkChannel(img11);

% A = atmLight(img11, JDark);
% transmission = transmissionEstimate(img11, A);
tMat = transmission;
% J = getRadiance(A,img11,tMat);
t0 = 0.1;
J = zeros(size(img11));
J=double(J);
A=double(A);
img11=double(img11);
for ind = 1:3
   J(:,:,ind) = A(ind) + (img11(:,:,ind) - A(ind))./max(tMat,t0); 
end

J = J./(max(max(max(J))));
figure,imshow(J,[]);
gamma=0.4;
im4=(J).^gamma;
figure,imshow(im4,[]);
figure;
subplot(1,2,1);imshow(original,[]);
subplot(1,2,2);imshow(im4,[]);
