function plot_vector_before(u,M,v)
% function plot_vector(u,M,v)

        trisurf(M,v(:,1),v(:,2),u,u);
 xlabel('x')
ylabel('y')      