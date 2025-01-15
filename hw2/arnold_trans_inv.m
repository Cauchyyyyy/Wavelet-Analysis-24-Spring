function im_new=arnold_trans_inv(im)
[m,n]=size(im);
im_new=zeros(size(im),'like',im);
for i=1:m
    for j=1:n
        temp=[2,-1;-1,1]*[i;j];
        if temp(1)>m || temp(2)>m || temp(1)<0 ||temp(2)<0
            temp=mod(temp,m);
        end
        temp(temp==0)=m;
        im_new(temp(1),temp(2))=im(i,j);
    end
end
end