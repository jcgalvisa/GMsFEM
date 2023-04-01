function [A,Igfree]=GlobalStiffness(u,dom,Nx,Ny)


A=sparse(length(u),length(u));
Igfree=[];
for i1=1:Nx
    for i2=1:Ny
    Alocal=dom(i1,i2).A;
    Ig=dom(i1,i2).Ig;
    Ifree=dom(i1,i2).Igfree;
    Igfree=unique([Igfree,Ifree]);
    A(Ig,Ig)=A(Ig,Ig)+Alocal;
    end
end

