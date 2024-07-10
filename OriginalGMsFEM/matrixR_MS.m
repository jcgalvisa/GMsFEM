function [R0,free,x0d]=matrixR_MS(b,dom_ov,Nx,Ny)

R0=sparse( length(b), (Nx+1)*(Ny+1));
dir=[];
vC=[];
for i1=1:Nx+1
    for i2=1:Ny+1
        I=(Nx+1)*(i2-1)+i1;
        coarsebasis=dom_ov(i1,i2).philinms;

        if i1==1 || i1==Nx+1|| i2==1|| i2==(Ny+1)
            dir=[dir,I];
            vC=[vC;dom_ov(i1,i2).c];
        end
        R0(:,I)=coarsebasis;
    end
end

free=setdiff(1:I,dir);

x0d=sparse(I,1);

X=vC(:,1);
Y=vC(:,2);
x0d_aux=boundary_condition(X,Y);
%x0d_aux=X*0;
x0d(dir)=x0d_aux;