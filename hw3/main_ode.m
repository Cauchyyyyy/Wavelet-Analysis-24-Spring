
alpha=1/3;k=32;
af=@(x) x^(1/3);
ff=@(x) (3/(2*gamma(2/3)))*x^(2/3)+x^(4/3);
A=get_A(af,k);
F=get_f_RHS(ff,k);

H=get_H(k,0);
P=get_p(alpha,k);

E=P*H;
E=E*A;
E=E+H;

C=F/E;

Y=zeros(1,k);X=zeros(1,k);
for i=1:k
    [h,x]=get_h_column(i,k);
    y=C*P*h;
    X(i)=x;
    Y(i)=y;
end
q=0:.05:1;
NY=interp1(X,Y,q);
plot(q,NY);

% Y=[];
% C=load('C.mat');
% C=C.C;
% PE=return_p_matrix(alpha,1024);
% 
% for i=1:k
%     h=return_h_column_x((2*i-1)/(2*k),1024);
%     y=C*PE*h;   
%     Y=[Y,y];
% end







