function x=apply_R0EMFBd_T(x0,dom_ov,Nx,Ny)

x=0*(dom_ov(1,1).philin);
%x0=sparse((Nx-1)*(Ny-1),1);
for i1=1:Nx+1
    for i2=1:Ny+1
        I=(Nx+1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).phiEM;
                x=x+x0(I)*phi1;
    end
end
