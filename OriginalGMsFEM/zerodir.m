function v=zerodir(u,dom,Nx,Ny)
v=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    Igfree=dom(i1,i2).Igfree;    
    v(Igfree)=u(Igfree);
    end
end

