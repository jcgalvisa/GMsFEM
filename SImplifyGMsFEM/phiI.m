function z=phiI(c,diamx,diamy,vx,vy)

x=(1- 2*abs(vx-c(1))/diamx);
y=(1- 2*abs(vy-c(2))/diamy);
z=x.*y;
