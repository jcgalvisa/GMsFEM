function [A0,dir,dirn,vC,P1]=coarse_matrixMBAD(dom,dom_ov,Nx,Ny)
dirn=[];
vC=[];
P1=[];
dir=[];
dimC=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        dimC=dimC+dom_ov(i1,i2).Nbad;
    end
end

A0=sparse( dimC,dimC );
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        NbadI=dom_ov(i1,i2).Nbad;

        for l=1:NbadI
            I=I+1;
            phi1=dom_ov(i1,i2).cb(l).phi;
            Aphi1=applay_M(phi1,dom,Nx,Ny);
            J=0;
            if i1==1 || i1==Nx+1|| i2==1|| i2==(Ny+1)
                if l==1
                    dirn=[dirn,I];
                    vC=[vC;dom_ov(i1,i2).c];
                    Ig=dom_ov(i1,i2).Ig;
                    psi1=dom_ov(i1,i2).psibad(:,1);
                    P1=[P1;psi1(Ig(1))];
                end
                dir=[dir,I];
            end

            for j1=1:Nx+1
                for j2=1:Ny+1
                    NbadJ=dom_ov(j1,j2).Nbad;
                    for m=1:NbadJ

                        phi2=dom_ov(j1,j2).cb(m).phi;
                        J=J+1;
                        A0(I,J)=dot(Aphi1,phi2);
                        A0(J,I)=dot(Aphi1,phi2);
                    end

                end
            end
        end
    end
end
