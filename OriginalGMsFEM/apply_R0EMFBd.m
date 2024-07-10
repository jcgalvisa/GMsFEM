function x0=apply_R0EMFBd(x,dom_ov,Nx,Ny)

x0=sparse((Nx+1)*(Ny+1),1);
for i1=1:Nx+1
    for i2=1:Ny+1
        I=(Nx+1)*(i2-1)+i1;
                phi1=dom_ov(i1,i2).phiEM;
                x0(I)=dot(x,phi1);
    end
end
