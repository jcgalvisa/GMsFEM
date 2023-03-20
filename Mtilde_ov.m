function dom_ov=Mtilde_ov(dom,dom_ov,Nx,Ny,k1perm)

%dom=piecewisecoeff2D(dom,Nx,Ny,mu,k1perm);
%newperm1ni

for i1=1:Nx+1
    for i2=1:Ny+1
                M=dom_ov(i1,i2).M;
                v=dom_ov(i1,i2).v;
                col=dom_ov(i1,i2).Ig;
                mesh=dom_ov(i1,i2).mesh;
                Tgradsquare=0;
        for j1=1:Nx+1
            for j2=1:Ny+1
                 x=dom_ov(j1,j2).philinms;
%                x=dom_ov(j1,j2).phiEM;
                u=x(col);
                [gradx,grady,Mpx,Mpy,Mpz]=grad_comp(u,M,v,mesh);
                gradsquare=gradx.^2+grady.^2;
                termtilde=(gradsquare);
                Tgradsquare=Tgradsquare+termtilde;



            end
        end
        Masstilde=NMassmatrixtilde(M,v,mesh,k1perm,Tgradsquare);
        dom_ov(i1,i2).gradsquare=Tgradsquare;
        dom_ov(i1,i2).Masstilde=Masstilde;
%         dom_ov(i1,i2).Masstilde=Masstilde*0+dom_ov(i1,i2).Mass;
    end
end