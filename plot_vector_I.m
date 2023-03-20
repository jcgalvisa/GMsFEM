function plot_vector_I(u,dom,i1,i2,mu,k1perm)
% function plot_vector(u,dom,Nx,Ny)

        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        trisurf(M,v(:,1),v(:,2),u(col),u(col));
       trisurf(M,v(:,1),v(:,2),u(col),coeficient(v(:,1),v(:,2),mu,k1perm));
        hold on

xlabel('x')
ylabel('y')

