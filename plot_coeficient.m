function plot_coeficient(M,v)
% function plot_error(u,dom,Nx,Ny)

        a=coeficient(v(:,1),v(:,2));
        trisurf(M,v(:,1),v(:,2),a,a);
  xlabel('x')
ylabel('y')  