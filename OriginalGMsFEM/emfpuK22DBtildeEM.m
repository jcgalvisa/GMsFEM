function dom_ov=emfpuK22DBtildeEM(dom,dom_ov,Nx,Ny,b,mu)



%xaux = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%[xaux, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);

for i1=1:Nx-1
    for i2=1:Ny-1
%        philin=dom_ov(i1,i2).philinnew;
        philin=dom_ov(i1,i2).philinms;
        Nbadtilde=dom_ov(i1,i2).NbadtildeEM;
        for l=1:Nbadtilde
        u=dom_ov(i1,i2).psibadtildeEM(:,l);
        dom_ov(i1,i2).cbtildeEM(l).phi=philin.*u;
        end
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
