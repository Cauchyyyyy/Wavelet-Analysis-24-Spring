%   验证Theorem2
%   bool数组元素表示不符合$|c_k|\leqslant \frac{2V}{\pi (k-m)^{m+1}}$的个数
n=[20,40,60,80,100,200,400,600];
m=5;
v=1;% bound of sin (x)
normm=zeros(size(n));
bool=zeros(size(n));

for i=1:length(n)
    [coeff,normm(i)]=test_thm2(@(x) sin(x),n(i),m,v);
    bool(i)=length(coeff(coeff>0));
end

semilogy(n,4*v*(pi*m*(n-m).^m).^(-1),n,normm);
legend('RHS','LHS');