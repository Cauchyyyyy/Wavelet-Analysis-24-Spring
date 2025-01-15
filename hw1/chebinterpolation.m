function a = chebinterpolation(func,N)
%CHEBINTERPOLATION fft法计算Chebyshev插值多项式
%   计算用于插值的Chebyshev各阶多项式的系数
    x=zeros(N,1);
    for i=1:N
        x(i)=cos((i-1)*pi/(N-1));
    end
    y=zeros(2*(N-1),1);
    y(1:N)=func(x);
    for i=2:N-1
        y(2*N-i)=y(i);
    end
    y=fft(y);
    y=real(y);
    %y=abs(y);
    a=y(1:N)/(N-1);
    a(1)=a(1)/2;
    a(N)=a(N)/2;
end

