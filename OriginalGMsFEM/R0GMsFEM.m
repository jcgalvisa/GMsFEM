function R0=R0GMsFEM(x,dom_ov,Nx,Ny)
dimC=0;
for i1=1:Nx+1
    for i2=1:Ny+1
        dimC=dimC+dom_ov(i1,i2).Nbad;
    end
end

n=length(x);
R0=sparse(n,dimC);
x0=sparse(dimC,1);
I=0;
for i1=1:Nx+1
    for i2=1:Ny+1
      Nbad=dom_ov(i1,i2).Nbad;
      for l=1:Nbad
      I=I+1;
      
                phi=dom_ov(i1,i2).cb(l).phi;
                R0(:,I)=phi;
                
      end
    end
end

