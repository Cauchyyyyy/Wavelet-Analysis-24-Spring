function [ P ] = get_p( alpha,k )
H=get_H(k,0);
F=get_F(alpha,k);
P=H*F;
P=P/H;

end

