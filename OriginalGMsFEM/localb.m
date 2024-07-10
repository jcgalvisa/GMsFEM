function L=localb(T,v,par)

x=zeros(3,1);
y=zeros(3,1);
L=zeros(3,1);

ix=mod(T,par.nex+1);
iy=((T-ix)/(par.nex+1))+1;

 for j=1:3
    x(j)=v(T(j),1);
    y(j)=v(T(j),2);
end

% den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));
% 
omega=[9*power(80,-1), (155+sqrt(15))/2400, (155+sqrt(15))/2400,(155+sqrt(15))/2400,(155-sqrt(15))/2400, (155-sqrt(15))/2400,(155-sqrt(15))/2400];

xi=[ power(3,-1), (6+sqrt(15))/21 ,(9-2*sqrt(15))/21,(6+sqrt(15))/21,(6-sqrt(15))/21 ,(9+2*sqrt(15))/21,(6-sqrt(15))/21];

eta=[power(3,-1),(6+sqrt(15))/21,(6+sqrt(15))/21,(9-2*sqrt(15))/21,(6- sqrt(15))/21,(6-sqrt(15))/21, (9+2*sqrt(15))/21];
% 
% u(1,:)=(1-xi-eta);
% u(2,:)=xi;
% u(3,:)=eta;
% txi=par.ax+((par.bx-par.ax)/(par.nex))*(ix(1)+xi+eta);
% teta=par.ay+((par.by-par.ay)/(par.ney))*(iy(1)+eta);
% function_f1=f_f(txi,teta);
% 
% for i=1:3
%    L(i)=sum( omega.*u(i,:).*function_f1);
% end
% 
% L=L*den;

den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));


txi=x(1)+xi*(x(2)-x(1))+eta*(x(3)-x(1));
teta=y(1)+xi*(y(2)-y(1))+eta*(y(3)-y(1));
x1=x(1); x2=x(2);x3=x(3);
y1=y(1); y2=y(2);y3=y(3);

pb(1,:)=1-xi-eta;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pb(2,:)=xi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pb(3,:)=eta;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%meanp=0;
%for i=1:3
%    meanp=meanp+u(2*par.nvel1+index(i))*pb(i,:);
%end
function_f1=forcingf(txi,teta);
for i=1:3
   L(i)=sum( omega.*pb(i,:).*function_f1);
%   L=L+sum( transpose(omega).*function_f2);
end

B=[x2-x1, x3-x1;y2-y1,y3-y1];

L=L*det(B);
%den=abs(x(2)*y(1)-x(3)*y(1)-x(1)*y(2)+x(3)*y(2)+x(1)*y(3)-x(2)*y(3));



