function plot_piecewisecoeff(dom,Nx)
% function plot_vector(u,dom,Nx,Ny)
color=0;
for i1=1:Nx
        color=color+1;
        M=dom(i1).M;
        v=dom(i1).v;
        col=dom(i1).Ig;
        coeff=dom(i1).coeff;
        ne=dom(i1).mesh.nv-1;
        for j=1:ne
         plot([v(M(j,1)), v(M(j,2))], [coeff(j),coeff(j)]);
        hold on
        end
    end
end


