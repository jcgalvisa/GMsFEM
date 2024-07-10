function [gradvel=Qx.^2+Qy.^2;
]=plot_grad_compsurf(x,dom,Nx,Ny,mu,k1perm)
Px=[];
Qx=[];
Py=[];
Qy=[];
for i1=1:Nx
    
    for i2=1:Ny
             M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        u=x(col);
        mesh=dom(i1,i2).mesh;
       [gradx,grady,Mpx,Mpy,Mpz]=grad_comp(u,M,v,mesh);
%       quiver(Mpx,Mpy,gradx,grady)
 %      maxx=50*max(abs(gradx.*coeficient(Mpx,Mpy,mu,k1perm)));
 %      maxy=50*max(abs(grady.*coeficient(Mpx,Mpy,mu,k1perm)));
       Px=[Px,Mpx];
       Py=[Py,Mpy];
%       Qx=[Qx,coeficient(Mpx,Mpy,mu,k1perm).*gradx];
%       Qy=[Qy,coeficient(Mpx,Mpy,mu,k1perm).*grady];
       Qx=[Qx,gradx.*coeficient(Mpx,Mpy,mu,k1perm)];
       Qy=[Qy,grady.*coeficient(Mpx,Mpy,mu,k1perm)];
 
    end
end


%      quiver(Px,Py,Qx,Qy,3)
%       hold on

gradvel=Qx.^2+Qy.^2;
