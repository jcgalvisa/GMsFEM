function pe=compute_pressure_at_elements(pvertex, Nx,Ny,nx,ny)


nex=Nx*nx
ney=Ny*ny

pe=sparse(1,nex*ney);
for j=1:ney
    for i=1:nex
        neI=ney*(j-1)+i;
        v1=(ney+1)*(j-1)+i;
        v2=(ney+1)*(j-1)+i+1;
        v3=(ney+1)*(j-1+1)+i+1;
        v4=(ney+1)*(j-1+1)+i;
%        [neI,v1,v2,v3,v4]
 %       pause
        pe(neI)=mean( pvertex([v1,v2,v3,v4]));
    end
end
