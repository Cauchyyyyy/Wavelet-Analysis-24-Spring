function [ H ] = get_H( k,flag)
    H=zeros(k);
    f=@(x,j,k) ((x<((0.5+k)/2^j))&&(x>=(k/2^j)))-(x<((1+k)/2^j)&&(x>=((0.5+k)/2^j)));
    [J ,K]=get_j_k(k-1);
    for i=(1-flag):(k-flag)
        H(1,i)=1;
        for j=1:k-1
            H(j+1,i)=((2^(J(j)/2))*f(((2*i-1)/(2*(k-flag))),J(j),K(j)));
        end        
    end    
end

