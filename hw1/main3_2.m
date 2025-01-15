%   验证Theorem3
%   g(x)=cos(100x)
%   bool数组元素表示不符合$|c_k|\leqslant 2*M*rho^(-k+1)$的个数
%   部分参考https://www.chebfun.org/examples/approx/EntireBound.html

rho=[1.5,2,3,3.5];
%   n=[20,40,60,80,100,150,200,300];
n=[25,50,75,100,125,150,175,200];
M=cosh(100*(rho-rho.^(-1))/2);
bool=zeros(length(rho),length(n));
normm=zeros(1,length(n));

for j=1:length(n)
    a1=chebinterpolation(@(x) cos(100*x),n(j));
    x=-1:0.01:1;
    y=cheb_interp_compute(a1,x);
    normm(j)=max(abs(y-cos(100*x)));
    for i=1:length(rho)
        
        test=zeros(length(a1),1);
        for k=2:length(test)
            test(k)=abs(a1(k))-2*M(i)*rho(i)^(-k+1);
        end
        test(1)=abs(a1(1))-M(i);
        bool(i,j)=length(test(test>0));
        
    end
end

rhs=zeros(length(rho),length(n));
for i=1:length(rho)
    for j=1:length(n)
        rhs(i,j)=4*M(i)*rho(i)^(-n(j))/(rho(i)-1);
    end
end

%% show figure
semilogy(n,normm,'r--');
hold on;
for i=1:length(rho)
    semilogy(n,rhs(i,:));
    hold on;
end
legend('LHS','rho=1.5','rho=2','rho=3','rho=3.5',Location='southwest');
xlabel('n');
grid on;