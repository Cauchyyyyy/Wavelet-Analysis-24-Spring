function y=chebpoly_k(k,x)
%   k阶Chebyshev多项式
    if k==0
        y=1;
    elseif k==1
        y=x;
    else
        y=2*x.*chebpoly_k(k-1,x)-chebpoly_k(k-2,x);
    end
end