function neigh=GMsFEMbasis(neigh,Nx,Ny)



for i1=1:Nx+1
    for i2=1:Ny+1
        philin=neigh(i1,i2).philin;
        Nbad=neigh(i1,i2).Nbad;
        for l=1:Nbad
            u=neigh(i1,i2).psibad(:,l);
            phiaux=philin.*u;
            mi=min(phiaux);
            ma=max(phiaux);
            if abs(mi)>=abs(ma)
                phiaux=-phiaux/abs(mi);
            else
                phiaux=phiaux/abs(ma);
            end
            neigh(i1,i2).cb(l).phi=phiaux;
        end
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
