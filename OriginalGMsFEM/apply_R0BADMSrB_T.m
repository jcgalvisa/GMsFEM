function x=apply_R0BADMSr_T(x0,dom_ov,Nx,Ny)

x=0*(dom_ov(1,1).philin);
%x0=sparse((Nx-1)*(Ny-1),1);
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        Nbad=dom_ov(i1,i2).Nbadr;
        for l=1:Nbad
            I=I+1;
            phi1=dom_ov(i1,i2).cbbadmsr(l).phi;
            x=x+x0(I)*phi1;
        end
    end
end