function dom_ov=emfBADmsB(dom,dom_ov,Nx,Ny,b)


for j1=1:Nx+1
    for j2=1:Ny+1
        NbadJ=dom_ov(j1,j2).Nbad;
        for l=1:NbadJ
            xlin=dom_ov(j1,j2).cb(l).phi;
            xlinms=xlin;
            for i1=1:Nx
                for i2=1:Ny
                    A=dom(i1,i2).A;
                    Ig=dom(i1,i2).Ig;
                    B=dom(i1,i2).B;
                    bry=[B.vup;B.vleft;B.vdown;B.vright];
                    It=1:size(Ig,2);
                    G=unique(bry);
                    G2=G;
%                     if (i1==1)
%                         G2=setdiff(G2,B.vleft);
%                     end
%                     if (i1==Nx)
%                         G2=setdiff(G2,B.vright);
%                     end
%                     if (i2==1)
%                         G2=setdiff(G2,B.vdown);
%                     end
%                     if (i2==Ny)
%                         G2=setdiff(G2,B.vup);
%                     end
% 
                    I=setdiff(It,G);
                    Gg=Ig(G2);
                    Intg=Ig(I);

                    lu=xlin(Gg);
                    AII=A(I,I);
                    AIG=A(I,G2);
                    AGI=A(G2,I);
                    AGG=A(G2,G2);

                    SuG=AGG*lu;
                    lsol=AII\(AIG*lu);
                    xlinms(Intg)=-lsol;
                end
            end
            dom_ov(j1,j2).cbbadms(l).phi=xlinms;
        end

    end
end
