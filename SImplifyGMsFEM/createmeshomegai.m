function [nodes_list_omegai,element_list_omegai]=createmeshomegai(nx,ny,Nx,Ny,I1,I2)

Cnx=2;Cny=2;
if I1==1 || I1==Nx+1
   Cnx=1;
end
if I2==1 || I2==Ny+1
   Cny=1;
end

nex=Cnx*nx;ney=ny*Cny;
nv=0;
for iy=1:ney+1
    for ix=1:nex+1
    nv=nv+1;
    Ilocalx=(I1-2+(I1==1))*nx+1 +(ix-1);
    Ilocaly=(I2-2+(I2==1))*ny+iy;
    ig=(Nx*nx+1)*(Ilocaly-1)+ Ilocalx;
    Ig(nv)=ig;
    end
end

nodes_list_omegai=Ig;
ne=0;
for iy=1:ney
    for ix=1:nex
    ne=ne+1;
    Ilocalex=(I1-2+(I1==1))*nx +ix;
    Ilocaley=(I2-2+(I2==1))*ny+iy;
    ige=(Nx*nx)*(Ilocaley-1)+ Ilocalex;
    Ie(ne)=ige;
    end
end
element_list_omegai=Ie;