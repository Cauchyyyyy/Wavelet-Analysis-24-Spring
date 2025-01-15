%% preparation
k=64;alpha=1;
num=1:k;
num=(2*num-1)/(2*k);

% RHS of PDE
F=zeros(k);
for i=1:k
    for j=1:k
        F(i,j)=f(num(i),num(j));
    end
end
% Haar matrix
H=get_H(k,0);
D=H*F*H';

%% ans

Pa=get_p(alpha,k);
P1=get_p(1,k);

fun=@(c) (P1'*c+(P1'*c*Pa)*(c*Pa*k)-D/k^2);
c=fsolve(fun,zeros(k));
z=H'*P1'*c*Pa*H;
surf(num,num,z);axis on;

function y=f(x,t)
    y=x+x*t^2;
end