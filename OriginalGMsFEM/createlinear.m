function w=createlinear(u,dom,Nx,Ny)
%%%
% Fine-grid vector satisfiyin boundary conditoion
w=sparse(size(u,1),size(u,2));
for i1=1:Nx
    for i2=1:Ny
    AI=dom(i1,i2).A;
    v=dom(i1,i2).v;
    Igfree=dom(i1,i2).Ig;
    waux=boundary_condition(v(:,1),v(:,2));
    w(Igfree)=waux;
    end
end