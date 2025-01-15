%% read image
rng default;
im=imread('peppers.png');
im=im2double(im);
imr=im(:,:,1);
img=im(:,:,2);
imb=im(:,:,3);
tiledlayout('flow');nexttile;
imshow(im);
title('origin');

%% Add noise to the image
% create noise matrix
imrn=imnoise(imr,'gaussian',0,0.01);
imgn=imnoise(img,'gaussian',0,0.01);
imbn=imnoise(imb,'gaussian',0,0.01);

%% Show the image with noise
imn=cat(3,imrn,imgn,imbn);
nexttile;
imshow(imn);
title('noised');
%% denoise

imd=wdenoise2(imn,2);
nexttile;
imshow(imd);
title('denoised,level=2');

imd=wdenoise2(imn,4);
nexttile;
imshow(imd);
title('denoised,level=4');

imd=wdenoise2(imn,8);
nexttile;
imshow(imd);
title('denoised,level=8');