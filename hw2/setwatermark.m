function im_new=setwatermark(im,wm,wname,trans_times,alpha)
%%  discrete wavelet transform, level=2
[ca1,ch1,cv1,cd1]=dwt2(im,wname);
[ca2,ch2,cv2,cd2]=dwt2(ca1,wname);

wm=imresize(wm,size(ca2));

%%  Arnold transform - prepare the watermark
for i=1:trans_times
    wm=arnold_trans(wm);
end

%%  watermark input
wm=double(wm);
[u1,s1,v1]=svd(wm);
[u2,s2,v2]=svd(ca2);
ss=s2+alpha*s1;
ca2_new=u2*ss*v2';

ca1_new=idwt2(ca2_new,ch2,cv2,cd2,wname);

ca1_new=imresize(ca1_new,size(ca1));

im_new=idwt2(ca1_new,ch1,cv1,cd1,wname);
im_new=uint8(im_new);
end