function plot_vector2(u,dom,Nx,Ny,mu,k1perm)
% function plot_vector(u,dom,Nx,Ny)
color=0;
for i1=1:Nx
    for i2=1:Ny
        color=color+1;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
         trimesh(M,v(:,1),v(:,2),u(col));
%         trisurf(M,v(:,1),v(:,2),u(col));
%       trisurf(M,v(:,1),v(:,2),u(col),coeficient(v(:,1),v(:,2),mu,k1perm));
        hold on
    end
end

xlabel('x')
ylabel('y')

