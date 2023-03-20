function plot_vector1Dnew(u,dom,Nx)
% function plot_vector(u,dom,Nx,Ny)
color=0;
for i1=1:Nx
        color=color+1;
        M=dom(i1).M;
        v=dom(i1).vnew;
        col=dom(i1).Ig;
%        trisurf(M,v(:,1),v(:,2),u(col),mod(i1+i2,2)+u(col)*0);
         plot(v(:,1),u(col),'-*');
        hold on

end


