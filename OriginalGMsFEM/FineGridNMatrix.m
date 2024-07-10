function [globalA, globalweightedMass, free]=FineGridNMatrix(b,dom,Nx,Ny)

free=[];
globalA=sparse(length(b),length(b));
globalweightedMass=sparse(length(b),length(b));
for i1=1:Nx
    for i2=1:Ny
    localA=dom(i1,i2).A;
    localM=dom(i1,i2).Mass;
    lfree=dom(i1,i2).Igfree;
    free=unique([free,lfree]);
    Ig=dom(i1,i2).Ig;    
    globalA(Ig,Ig)=globalA(Ig,Ig)+localA;
    globalweightedMass(Ig,Ig)=globalweightedMass(Ig,Ig)+localA;
    end
end
