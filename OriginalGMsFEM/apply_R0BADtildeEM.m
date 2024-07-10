function x0=apply_R0BADtildeEM(x,dom_ov,Nx,Ny)
dimC=0;
for i1=1:Nx-1
    for i2=1:Ny-1
        dimC=dimC+dom_ov(i1,i2).NbadtildeEM ;
    end
end

x0=sparse(dimC,1);
I=0;
for i1=1:Nx-1
    for i2=1:Ny-1
      Nbad=dom_ov(i1,i2).NbadtildeEM;
      for l=1:Nbad
      I=I+1;
      
                phi1=dom_ov(i1,i2).cbtildeEM(l).phi;
                x0(I)=dot(x,phi1);
      end
    end
end

