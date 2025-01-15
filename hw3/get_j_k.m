function [J,K] = get_j_k( n )
    j=0;k=0;J=zeros(1,n);K=zeros(1,n);
    for i=1:n   
    k=0;
    while i~=2^j+k
        k=k+1;
        if k==2^j
            j=j+1;k=0;
            break
        end
    end
    J(i)=j;
    K(i)=k;  
    end 
end







