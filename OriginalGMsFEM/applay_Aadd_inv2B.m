function w=applay_Aadd_inv2B(u,dom_ov,Nx,Ny)

w=sparse(size(u,1),size(u,2));

for i1=1:Nx+1
    for i2=1:Ny+1
%    AI=dom_ov(i1,i2).A;
%    Igfree=dom_ov(i1,i2).Igfree;
%    free=dom_ov(i1,i2).free;
    
    
                A=dom_ov(i1,i2).A;
                Ig=dom_ov(i1,i2).Ig;
                B=dom_ov(i1,i2).B;
                bry=[B.vup;B.vleft;B.vdown;B.vright];
                It=1:size(Ig,2);
                G=unique(bry);
                G2=G;
                if (i1==1)
                    G2=setdiff(G2,B.vleft);
                end
                if (i1==Nx+1)
                    G2=setdiff(G2,B.vright);
                end
                if (i2==1)
                    G2=setdiff(G2,B.vdown);
                end
                if (i2==Ny+1)
                    G2=setdiff(G2,B.vup);
                end   
                I=setdiff(It,G2);
%                Gg=Ig(G2);
                Intg=Ig(I);

%                lu=(Igfree);
%                AII=A(I,I);
%                AIG=A(I,G2);
%                AGI=A(G2,I);
%                AGG=A(G2,G2);


    
    lu=u(Intg);
    lAu=A(I,I)\lu;
    w(Intg)=w(Intg)+lAu;
    
    end
end
