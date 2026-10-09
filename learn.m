function [w1,wo]=learn(out,xout,yh,wo,xin,w1)
d_i=size(w1,1);
d_h=size(wo,1);
d_o=size(wo,2);
%back propergation
dou=[];
lr=0.91;
dwo=[];
%output layer
for i=1:d_o
ou=out(i);
dou1=ou*(1-ou)*(xout(i)-ou);
dou=[dou,dou1];
endfor
%out to hidden layer
nu=1;
whh=[];
for k=1:d_h
  wh=0;
  for i=1:d_o
    wo(k,i)+=nu*yh(k)*dou(i);
    wh+=wo(k,i)*dou(i);
  endfor
  whh=[whh,yh(k)*(1-yh(k))*wh];
endfor
for k=1:d_i
  for j=1:d_h
     dw=nu*xin(k)*whh(j);
     w1(k,j)+=dw;
  endfor
endfor
endfunction
