function y = cheb_interp_lag(func,N,y)
%CHEB_INTERP_LAG 
%   Lagrange插值法构造Chebyshev插值多项式
    x=0:N-1;
    x=cos((2*x+1)*pi/(2*N));
    y=lagrange(func,x,y);
end

