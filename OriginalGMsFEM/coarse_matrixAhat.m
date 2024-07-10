function [A0,dir,vC]=coarse_matrixAhat(dom,dom_ov,Nx,Ny,Ahat)

A0=sparse( (Nx+1)*(Ny+1), (Nx+1)*(Ny+1));

dir=[];
vC=[];
for i1=1:Nx+1
    for i2=1:Ny+1
        I=(Nx+1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).philin;
                Aphi1=Ahat*phi1;
                if i1==1 || i1==Nx+1|| i2==1|| i2==(Ny+1) 
                 dir=[dir,I];
                 vC=[vC;dom_ov(i1,i2).c];
                end

        for j1=1:Nx+1
            for j2=1:Ny+1
                phi2=dom_ov(j1,j2).philin;
                J=(Nx+1)*(j2-1)+j1;
             A0(I,J)=dot(Aphi1,phi2);

            end
        end
    end
end
