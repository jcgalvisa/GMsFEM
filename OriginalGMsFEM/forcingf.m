
function y1=forcingf(x1,x2)
y1=0*x1+10;
%y1=8*sin(x2*(2*pi))-4*x1.*(x1-1).*sin(x2*(2*pi))*(2*pi)^2;

%y1= abs(x1-0.5)+abs(x2-0.5)<.4;
%y1=coeficientchannelball(x1,x2, 9999999).*x1;
%y1=(abs(x1-0)<1/30).*(abs(x2-0.5)<1/30)-(abs(1-x1)<1/30).*(abs(0.5-x2)<1/30);
%y1=sin(2*pi*x1).*sin(2*pi*x2);