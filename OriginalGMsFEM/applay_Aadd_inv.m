function w=applay_Aadd_inv(u,dom, dom_ov,Nx,Ny)
w=sparse(size(u,1),size(u,2));
% Au=applay_A(u,dom,Nx,Ny);
% eu=dot(u,Au);
for i1=2:Nx
    for i2=2:Ny
    AI=dom_ov(i1,i2).A;
    Igfree=dom_ov(i1,i2).Igfree;
    free=dom_ov(i1,i2).free;
    lu=u(Igfree);
    lAu=AI(free,free)\lu;
%     wi=w*0;
%     wi(Igfree)=lAu;
    w(Igfree)=w(Igfree)+lAu;
%     Awi=applay_A(wi,dom,Nx,Ny);
%     eui((i1-1)*Ny+i2)=dot(Awi,wi);

    end
end
% max(eui./eu)
% pause