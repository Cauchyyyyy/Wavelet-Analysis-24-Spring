a=chebinterpolation(@(x) f(x),21);
a=transpose(a);
x=-1:0.1:1;
y=zeros(1,length(x));
for i=1:20
    y=y+a(i)*chebpoly_k(i-1,x);
end

y0=cheb_interp_lag(@(x) f(x),21,x);
y1=cheb_interp_compute(a,x);
error1=(abs(y-f(x)));
error2=(abs(y0-f(x)));
error3=(abs(y1-f(x)));
%plot(x,y,x,f(x),x,y0);


function y=f(x)
    y=(1+25*x.^2).^(-1);
end