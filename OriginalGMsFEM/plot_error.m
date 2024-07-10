function plot_error(u,M,v)
% function plot_error(u,dom,Nx,Ny)

        u_exact=solution(v(:,1),v(:,2));
        trisurf(M,v(:,1),v(:,2),abs(u-u_exact));
  xlabel('x')
ylabel('y')      