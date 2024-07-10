function A0=coarse_matrix2(dom,dom_ov,Nx,Ny)

A0=sparse( (Nx-1)*(Ny-1), (Nx-1)*(Ny-1));

for i1=1:Nx-1
    for i2=1:Ny-1
        I=(Nx-1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).philin2;
                Aphi1=applay_A(phi1,dom,Nx,Ny);
        for j1=1:Nx-1
            for j2=1:Ny-1
                phi2=dom_ov(j1,j2).philin2;
                J=(Nx-1)*(j2-1)+j1;
             A0(I,J)=dot(Aphi1,phi2);

            end
        end
    end
end
