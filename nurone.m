d_i=2;
d_o=1;
d_h=2;
xin=[0.35,0.9];%rand(1,d_i)
xout=0.5;%rand(d_o)
w1=[[0.1,0.8];[0.4,0.6]];%rand(d_i,d_h)
wo=[0.3;0.9];%rand(d_h,d_o)
% [[w11,w21],[w12,w22]]
%forward pass
epoch=100
err=[]
id=[]
[ou,yh,out]=frwd(xin,xout,w1,wo);
for i=1:epoch

[w1,wo]=learn(out,xout,yh,wo,xin,w1);
[ou,yh,out]=frwd(xin,xout,w1,wo);
err=[err out-xout];
id=[id,i];
endfor
plot(id,err)
