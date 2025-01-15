function [coeff,normm] = test_thm2(func,n,m,v)
%   验证Theorem2
%   给出Chebyshev插值的系数与要验证的差值、与目标函数的2范数
a=chebinterpolation(func,n);

test=zeros(length(a),1);
for k=m+1:length(a)
    test(k)=abs(a(k))-2*v/(pi*(k-m)^(m+1));
end
coeff=test;
%x=-1:0.01:1;
%p=cheb_interp_compute(a,x);
normm=sqrt(integral(@(x) (cheb_interp_compute(a,x)-sin(x)).^2,-1,1));

end