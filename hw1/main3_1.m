%   验证Theorem3
%   f(x)=exp(x)
%   bool数组元素表示不符合$|c_k|\leqslant 2*M*rho^(-k+1)$的个数
%   部分参考https://www.chebfun.org/examples/approx/EntireBound.html

rho=[2,4,8,16,32];
%   n=[20,40,60,80,100,150,200,300];
n=5:2:25;
M=exp((rho+rho.^(-1))/2);

bool=zeros(length(rho),length(n));
normm=zeros(length(n),1);
for j=1:length(n)
    a1=chebinterpolation(@(x) exp(x),n(j));
    x=-1:0.01:1;
    y=cheb_interp_compute(a1,x);
    normm(j)=max(abs(y-exp(x)));
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
legend('LHS','rho=2','rho=4','rho=8','rho=16','rho=32',Location='southwest');
xlabel('n');
grid on;

