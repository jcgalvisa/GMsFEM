function w=createlinear(u,dom,Nx,Ny)
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    AI=dom(i1,i2).A;
    v=dom(i1,i2).v;
    Igfree=dom(i1,i2).Ig;
    w(Igfree)=boundary_condition(v(:,1),v(:,2));
%    w(Igfree)=v(:,1)*0;
    end
end