function result=getwatermark(im,origin,logo,wname,arnold_times,alpha)
%   input parameters: watermarked image, origin image, watermark, wavelet function's name, iteration times for inverse arnold transform, alpha
    [ca1,chd1,cvd1,cdd1]=dwt2(im,wname);
    [ca2,chd2,cvd2,cdd2]=dwt2(ca1,wname);

    logo=imresize(logo,size(ca2));

    [ca1_origin,chd1_origin,cvd1_origin,cdd1_origin]=dwt2(origin,wname);
    [ca2_origin,chd2_origin,cvd2_origin,cdd2_origin]=dwt2(ca1_origin,wname);

    [u,s,v]=svd(ca2);
    [u_origin,s_origin,v_origin]=svd(ca2_origin);

    s_pur=(s-s_origin)/alpha;

    for i=1:arnold_times
        logo=arnold_trans(logo);
    end

    logo=double(logo);
    [u_logo,s_logo,v_logo]=svd(logo);
    wm=u_logo*s_pur*v_logo';

    for i=1:arnold_times
        wm=arnold_trans_inv(wm);
    end    

    result=uint8(wm);
end