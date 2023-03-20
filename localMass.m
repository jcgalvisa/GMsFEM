function L=localMass(T,v,k1perm)

x=zeros(3,1);
y=zeros(3,1);

for j=1:3
    x(j)=v(T(j),1);
    y(j)=v(T(j),2);
end

% trimesh([1,2,3], x,y);
% axis([0,1,0,1])
% pause(0.001)

omega=[9*power(80,-1), (155+sqrt(15))/2400, (155+sqrt(15))/2400,(155+sqrt(15))/2400,(155-sqrt(15))/2400, (155-sqrt(15))/2400,(155-sqrt(15))/2400];

xi=[ power(3,-1), (6+sqrt(15))/21 ,(9-2*sqrt(15))/21,(6+sqrt(15))/21,(6-sqrt(15))/21 ,(9+2*sqrt(15))/21,(6-sqrt(15))/21];

eta=[power(3,-1),(6+sqrt(15))/21,(6+sqrt(15))/21,(9-2*sqrt(15))/21,(6- sqrt(15))/21,(6-sqrt(15))/21, (9+2*sqrt(15))/21];

den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));


txi=x(1)+xi*(x(2)-x(1))+eta*(x(3)-x(1));
teta=y(1)+xi*(y(2)-y(1))+eta*(y(3)-y(1));
x1=x(1); x2=x(2);x3=x(3);
y1=y(1); y2=y(2);y3=y(3);

pb(1,:)=(x3*(teta - y2) + txi*(y2 - y3) + x2*(-teta + y3))/(-(x2*y1) + x3*y1 + x1*y2 - x3*y2 - x1*y3 + x2*y3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pb(2,:)=(x3*(-teta + y1) + x1*(teta - y3) + txi*(-y1 + y3))/(-(x2*y1) + x3*y1 + x1*y2 - x3*y2 - x1*y3 + x2*y3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pb(3,:)=(x2*(teta - y1) + txi*(y1 - y2) + x1*(-teta + y2))/(-(x2*y1) + x3*y1 + x1*y2 - x3*y2 - x1*y3 + x2*y3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

coef=coefficient(txi,teta,k1perm);
for i1=1:3
    for i2=1:3
            UxV=pb(i1,:).*pb(i2,:);
            integrand=coef.*UxV;
            L(i1,i2)=sum( omega.*integrand);
    end
end


L=L*den;
