function L=localA(T,v,mu,k1perm)

x=zeros(4,1);
y=zeros(4,1);

for j=1:4
    x(j)=v(T(j),1);
    y(j)=v(T(j),2);
end


o=[5/9,8/9,5/9]; p=[-sqrt(15)/5,0,+sqrt(15)/5];
P=p([1,1;1,2;1,3;2,1;2,2;2,3;3,1;3,2;3,3]);
Omega=[o(1)*o'; o(2)*o'; o(3)*o'];


x1=x(1); x2=x(2);x3=x(3); x4=x(4);
y1=y(1); y2=y(2);y3=y(3); y4=y(4);
hx=x2-x1;
hy=y4-y1;


xi=x(1)+0.5*(1+P(:,1))*(x(2)-x(1));
eta=y(1)+0.5*(1+P(:,2))*(y(4)-y(1));

txi= (xi-x1)/hx;
teta= (eta-y1)/hy;


ub(1,:)=(1-  txi  ) .*( 1- teta ); 
ub(2,:)=(txi).*(1-teta); 
ub(3,:)=(txi).*teta; 
ub(4,:)=(1-txi).*(teta); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ub_x(1,:)=-(1-teta)/hx; ub_y(1,:)=-(1-txi)/hy;
ub_x(2,:)=(1-teta)/hx; ub_y(2,:)=-(txi)/hy;
ub_x(3,:)=teta/hx; ub_y(3,:)=(txi)/hy;
ub_x(4,:)=-teta/hx; ub_y(4,:)=(1-txi)/hy;
% [ub_x;ub_y];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

coef=xi'*0+1;
for i1=1:4
    for i2=1:4
            gradUxgradV=ub_x(i1,:).*ub_x(i2,:)+ub_y(i1,:).*ub_y(i2,:);
            integrand=coef.*gradUxgradV;
            L(i1,i2)=sum( Omega'.*integrand);
    end
end

L=L*hx/2*hy/2;




