function y = cheb_interp_compute(a,x)
%   通过存储每一步的计算结果，提高递归计算Chebyshev多项式的速度
    n=length(a);m=length(x);
    temp=zeros(n,m);temp(1,:)=ones(m,1);temp(2,:)=x;
    for i=3:n
        for j=1:m
            temp(i,j)=2*x(j)*temp(i-1,j)-temp(i-2,j);
        end
    end
    y=a'*temp;
end