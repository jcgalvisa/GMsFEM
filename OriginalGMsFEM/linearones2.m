function dom_ov=linearones2(dom,dom_ov,Nx,Ny,b)

for i1=1:Nx+1
    for i2=1:Ny+1
        phi=dom_ov(i1,i2).philin;
        psi1=dom_ov(i1,i2).psibad(:,1);
%        whos phi psi1
        dom_ov(i1,i2).philin2=phi.*abs(psi1);
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
