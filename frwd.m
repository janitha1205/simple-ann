function [ou,yh,out]=frwd(xin,xout,w1,wo)
d_i=size(w1,1);
d_h=size(wo,1);
d_o=size(wo,2);
ah=xin*w1;%[ah1 , ah2]
%activation function
yh=[];
for i=1:d_h
  yh=[yh,activation_f(ah(i))];
endfor


a_out=yh*wo;
out=[];
err=[];
for i=1:d_o
ou=activation_f(a_out(i));
%dou=ou*(1-ou)*(xout(i)-ou)
out=[out,ou];
err=[err,xout(i)-ou];
endfor
endfunction
