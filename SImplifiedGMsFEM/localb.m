function L=localb(T,v)

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


%meanp=0;
%for i=1:3
%    meanp=meanp+u(2*par.nvel1+index(i))*pb(i,:);
%end
function_f1=forcing(xi,eta);
for i=1:4
   L(i)=sum( Omega'.*ub(i,:).*function_f1');
%   L=L+sum( transpose(omega).*function_f2);
end


L=L*hx/2*hy/2;
%den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));



