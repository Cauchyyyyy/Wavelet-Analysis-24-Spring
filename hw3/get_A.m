function [ A ] = get_A( f,k )
v=zeros(1,k);
for i=1:k
    v(i)=f((2*i-1)/(2*k));
end

A=diag(v);

end

