function [ fvalue ] = get_f_RHS( f,k)
fvalue=zeros(1,k);

for i=1:k
   fvalue(i)=f(((2*i-1)/(2*k)));
end

end

