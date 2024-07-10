function w=createone(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    AI=dom(i1,i2).A;
    Igfree=dom(i1,i2).Igfree;
    w(Igfree)=1;
    end
end