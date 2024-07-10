
function plot_error_global(x,dom,Nx,Ny)

for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        Ig=dom(i1,i2).Ig;
        plot_error(x(Ig),M,v);
        hold on
    end
end