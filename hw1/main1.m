% 验证Chebyshev插值效果

N=input("please enter the number N\n"); %结点数
x=-1:0.01:1;
ff=input("which function do you want to test? 1 or 2\n");   %函数选择
if ff==1
    plot(x,f1(x),"r--");    
    hold on;
    a=chebinterpolation(@(x) f1(x),N);
    y1=cheb_interp_compute(a,x);
    error1=(abs(y1-f1(x)));
    plot(x,y1,x,error1);
    legend('origin','fitted','error');
    hold on;
    fprintf('the max error is %d\n',max(error1));
elseif ff==2
    plot(x,f2(x),"g--");
    hold on;
    a=chebinterpolation(@(x) f2(x),N);
    y1=cheb_interp_compute(a,x);
    error1=(abs(y1-f2(x)));
    plot(x,y1,x,error1);
    legend('origin','fitted','error');
    hold on;
    fprintf('the max error is %d\n',max(error1));
end



function y=f1(x)
y=abs(sin(6*x)).^3-cos(5*exp(x));
end

function y = f2(x)
y=(1+25*x.^2).^(-1)-sin(20*x);
end