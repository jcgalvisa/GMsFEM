
function eT=norm_l2_global(x,dom,Nx,Ny)
eT=0;
for i1=1:Nx
    for i2=1:Ny
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        Ig=dom(i1,i2).Ig;
        eh1=norm_l2(x(Ig),M,v,mesh);
        eT=eT+eh1;
    end
end