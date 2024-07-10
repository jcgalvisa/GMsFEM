function [R0,free,x0d]=matrixR_GMsFEM(b,neigh,Nx,Ny)
fprintf('GMsFEM Coarse Matrix...\n');

dirn=[];
vC=[];
P1=[];
dir=[];
dimC=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        dimC=dimC+neigh(i1,i2).Nbad;
    end
end

R0=sparse( length(b),dimC );
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        NbadI=neigh(i1,i2).Nbad;

        for l=1:NbadI
            I=I+1;
            coarsebasis=neigh(i1,i2).cb(l).phi;
            if i1==1 || i1==Nx+1|| i2==1|| i2==(Ny+1)
%            if i1==1 || i1==Nx+1
                if l==1
                    dirn=[dirn,I];
                    vC=[vC;neigh(i1,i2).c];
                    Ig=neigh(i1,i2).nodes;
                    psi1=neigh(i1,i2).psibad(:,1);
                    P1=[P1;psi1(Ig(1))];
                end
                dir=[dir,I];
            end
            R0(:,I)=coarsebasis;
        end
    end
end



free=setdiff(1:I,dir);
x0d=sparse(I,1);

X=vC(:,1);
Y=vC(:,2);
x0d_aux=boundary_condition(X,Y);%./P1;
%x0d_aux=X*0;
x0d(dirn)=x0d_aux;