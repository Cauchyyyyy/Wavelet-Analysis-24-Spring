function p = lagrange(func ,x0,x)
%LAGRANGE 
%计算lagrange插值函数
    n=length(x0);p=0;
    for i=1:n
        basis=1;    %计算lagrange基函数
        for j=1:n
            if i~=j
                basis=basis.*(x-x0(j))/(x0(i)-x0(j));
            end
        end
        p=p+basis.*func(x0(i));
    end
end


