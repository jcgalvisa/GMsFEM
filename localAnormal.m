function L=localAnormal(T,v,k1perm)

x=zeros(3,1);
y=zeros(3,1);

for j=1:3
    x(j)=v(T(j),1);
    y(j)=v(T(j),2);
end

omega=[9*power(80,-1), (155+sqrt(15))/2400, (155+sqrt(15))/2400,(155+sqrt(15))/2400,(155-sqrt(15))/2400, (155-sqrt(15))/2400,(155-sqrt(15))/2400];

xi=[ power(3,-1), (6+sqrt(15))/21 ,(9-2*sqrt(15))/21,(6+sqrt(15))/21,(6-sqrt(15))/21 ,(9+2*sqrt(15))/21,(6-sqrt(15))/21];

eta=[power(3,-1),(6+sqrt(15))/21,(6+sqrt(15))/21,(9-2*sqrt(15))/21,(6- sqrt(15))/21,(6-sqrt(15))/21, (9+2*sqrt(15))/21];

den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));

txi=x(1)+xi*(x(2)-x(1))+eta*(x(3)-x(1));
teta=y(1)+xi*(y(2)-y(1))+eta*(y(3)-y(1));
x1=x(1); x2=x(2);x3=x(3);
y1=y(1); y2=y(2);y3=y(3);
B=[x2-x1, x3-x1;y2-y1,y3-y1];
InvB=inv(B);

pb(1,:)=(x3*(teta - y2) + txi*(y2 - y3) + x2*(-teta + y3))/(-(x2*y1) + x3*y1 + x1*y2 - x3*y2 - x1*y3 + x2*y3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pb(2,:)=(x3*(-teta + y1) + x1*(teta - y3) + txi*(-y1 + y3))/(-(x2*y1) + x3*y1 + x1*y2 - x3*y2 - x1*y3 + x2*y3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pb(3,:)=(x2*(teta - y1) + txi*(y1 - y2) + x1*(-teta + y2))/(-(x2*y1) + x3*y1 + x1*y2 - x3*y2 - x1*y3 + x2*y3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

edge=[1,2;1,3;2,3];

e(1,:)=[x(2)-x(1),y(2)-y(1)];
e(2,:)=[x(3)-x(1),y(3)-y(1)];
e(3,:)=[x(3)-x(2),y(3)-y(2)];


ne(1,2)=norm([x(2)-x(1),y(2)-y(1)]);
ne(1,3)=norm([x(3)-x(1),y(3)-y(1)]);
ne(3,2)=norm([x(3)-x(2),y(3)-y(2)]);



normal(1,:)=[y(2)-y(1),-x(2)+x(1)]/ne(1,2);
normal(2,:)=[y(3)-y(1),-x(3)+x(1)]/ne(1,3);
normal(3,:)=[y(3)-y(2),-x(3)+x(2)]/ne(2,3);



ne=(ne+ne');

ub_x(2)=InvB(1,1);ub_y(2)=InvB(1,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ub_x(3)=InvB(2,1);ub_y(3)=InvB(2,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ub_x(1)=-InvB(1,1)-InvB(2,1);ub_y(1)=-InvB(1,2)-InvB(2,2);
% [ub_x;ub_y];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for ie=1:3
    s1=edge(ie,1);
    s2=edge(ie,2);
    
    t=linspace(0.1,0.9,10);
    txi=x(s1)+t*(x(s2)-x(s1));
    teta=y(s1)+t*(y(s2)-y(s1));
    coef=mean(coefficient(txi,teta,k1perm));
    ngradU=ub_x(s1)*normal(ie,1)+ub_y(s1)*normal(ie,2);
    %            whos omega integrand
    %            pause
    L(s1,s2)=coef*ngradU*ne(s1,s2)/2;
    
    ngradU=ub_x(s2)*normal(ie,1)+ub_y(s2)*normal(ie,2);
    %            whos omega integrand
    %            pause
    L(s2,s1)=ngradU*ne(s1,s2)/2;
    
end
end




