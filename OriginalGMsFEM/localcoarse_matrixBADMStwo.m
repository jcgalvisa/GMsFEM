function A0=localcoarse_matrixBADMStwo(dom,dom_ov,i1,i2,Nx,Ny)

I=0;
NbadI=dom_ov(i1,i2).Nbad;
for l=1:NbadI
    I=I+1;
    phi1=dom_ov(i1,i2).cbbadms(l).phi;
    Aphi1=applay_A(phi1,dom,Nx,Ny);
    J=0;

    j1=i1;
    j2=i2;
    NbadJ=dom_ov(j1,j2).Nbad;
    for m=1:NbadJ

        phi2=dom_ov(j1,j2).cbbadms(m).phi;
        J=J+1;
        A0(I,J)=dot(Aphi1,phi2);
        A0(J,I)=dot(Aphi1,phi2);
    end

end
