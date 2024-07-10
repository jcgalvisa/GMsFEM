function plot_coeff(dom,Nx,Ny,mu,k1)
% function plot_vector(u,dom,Nx,Ny)

for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        x=v(:,1);
        y=v(:,2);
        trisurf(M,v(:,1),v(:,2),coeficient(x,y,mu,k1));
        hold on
%        pause
    end
end

xlabel('x')
ylabel('y')

