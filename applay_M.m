function w=applay_M(u,dom,Nx,Ny)
Au=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny

        M=dom(i1,i2).Mass;
    Ig=dom(i1,i2).Ig;
    lu=u(Ig);
    lAu=M*lu;
    Au(Ig)=Au(Ig)+lAu;
    end
end
w=Au;