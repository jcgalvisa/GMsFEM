function w=applay_AN(u,dom,Nx,Ny)
Au=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    A=dom(i1,i2).A;
    Ig=dom(i1,i2).Ig;    
    lu=u(Ig);
    lAu=A*lu;
    Au(Ig)=Au(Ig)+lAu;
    end
end
w=Au;