function w=applay_A(u,dom,Nx,Ny)
Au=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    A=dom(i1,i2).A;
    free=dom(i1,i2).free;
    AI=A(free,free);
    Igfree=dom(i1,i2).Igfree;
    lu=u(Igfree);
    lAu=AI*lu;
    Au(Igfree)=Au(Igfree)+lAu;
    end
end
w=Au;