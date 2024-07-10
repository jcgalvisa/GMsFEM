function plot_exact(dom,Nx,Ny)
% function plot_vector(u,dom,Nx,Ny)

for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        col=dom(i1,i2).Ig;
        trisurf(M,v(:,1),v(:,2),solution(v(:,1),v(:,2)));
        hold on
%        pause
    end
end

xlabel('x')
ylabel('y')

