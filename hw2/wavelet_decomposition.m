im=imread('wpeppers.jpg');
im=im2gray(im);

im1=arnold_trans(im);
im2=arnold_trans_inv(im1);

level=1;
[c,s]=wavedec2(im,level,'Haar');
[chd1,cvd1,cdd1]=detcoef2('all',c,s,level);
a=appcoef2(c,s,'Haar',level);

test=[a,chd1;cvd1,cdd1];
imshow(test);

imagesc(a);