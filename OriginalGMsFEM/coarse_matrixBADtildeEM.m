function A0=coarse_matrixBADtildeEM(dom,dom_ov,Nx,Ny)
dimC=0;
for i1=1:Nx-1
    for i2=1:Ny-1
        dimC=dimC+dom_ov(i1,i2).NbadtildeEM;
    end
end

A0=sparse( dimC,dimC );
I=0;
for i1=1:Nx-1
    for i2=1:Ny-1
        NbadI=dom_ov(i1,i2).NbadtildeEM;
        for l=1:NbadI
            I=I+1;
            phi1=dom_ov(i1,i2).cbtildeEM(l).phi;
            Aphi1=applay_A(phi1,dom,Nx,Ny);
                    J=0;

            for j1=1:Nx-1
                for j2=1:Ny-1
                    NbadJ=dom_ov(j1,j2).NbadtildeEM;
                    for m=1:NbadJ

                        phi2=dom_ov(j1,j2).cbtildeEM(m).phi;
                        J=J+1;
                        A0(I,J)=dot(Aphi1,phi2);
                        A0(J,I)=dot(Aphi1,phi2);
                    end

                end
            end
        end
    end
end
