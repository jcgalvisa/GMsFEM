function dom_ov=GMsFEMbasis(dom,dom_ov,Nx,Ny)



%xaux = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%[xaux, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);

for i1=1:Nx+1
    for i2=1:Ny+1
        philin=dom_ov(i1,i2).philin;
        Nbad=dom_ov(i1,i2).Nbad;
        for l=1:Nbad
        u=dom_ov(i1,i2).psibad(:,l);
        dom_ov(i1,i2).cb(l).phi=philin.*u;
        end
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
