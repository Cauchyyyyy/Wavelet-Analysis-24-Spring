%%  read image
tiledlayout('flow');
im=imread('wpeppers.jpg');
im=im2gray(im);
nexttile;
imshow(im);title('origin');
wm=imread('ustcblue.jpg');
wm=im2gray(wm);
nexttile;
imshow(wm);title('watermark');

wname='db4';
arnold_times=5;
%%  set watermark
im_new=setwatermark(im,wm,wname,arnold_times,0.1);
nexttile;
imshow(im_new);title('watermarked');

%%  extract the watermark from the watermarked image
watermarked_image=im_new;
origin=im;

extracted_watermark = getwatermark(watermarked_image,origin,wm,wname,arnold_times,0.1);
nexttile;
imshow(extracted_watermark);
title('Extracted watermark');

%%  check robustness
% Add noise to the watermarked image
im1=imnoise(watermarked_image,"gaussian");
im2=imnoise(watermarked_image,"salt & pepper");
im3=imnoise(watermarked_image,"speckle");
im4=imnoise(watermarked_image,"poisson");

% Extract the watermark from the noisy watermarked image
extracted_watermark1 = getwatermark(im1,origin,wm,wname,arnold_times,0.1);
extracted_watermark2 = getwatermark(im2,origin,wm,wname,arnold_times,0.1);
extracted_watermark3 = getwatermark(im3,origin,wm,wname,arnold_times,0.1);
extracted_watermark4 = getwatermark(im4,origin,wm,wname,arnold_times,0.1);

nexttile;
imshow(extracted_watermark1);
title('Extracted watermark with Gaussian noise');
nexttile;
imshow(extracted_watermark2);
title('Extracted watermark with Salt & Pepper noise');
nexttile;
imshow(extracted_watermark3);
title('Extracted watermark with Speckle noise');
nexttile;
imshow(extracted_watermark4);
title('Extracted watermark with Poisson noise');

%%  calculate the PSNR between the original image and the watermarked image
y=psnr(im_new,im);

%%  calculate the PSNR between the original watermark and the extracted watermark
wm=imresize(wm,size(extracted_watermark));
y_wm=[psnr(extracted_watermark,wm),psnr(extracted_watermark1,wm),psnr(extracted_watermark2,wm),psnr(extracted_watermark3,wm),psnr(extracted_watermark4,wm)];
