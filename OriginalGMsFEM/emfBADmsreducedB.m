function dom_ov=emfBADmsreducedB(dom,dom_ov,Nx,Ny,b)



for i1=1:Nx+1
    for i2=1:Ny+1
        Nbad=dom_ov(i1,i2).Nbad;
        A0=localcoarse_matrixBADMStwo(dom,dom_ov,i1,i2,Nx,Ny);
        [Q,D]=eig(full(A0));
        [lambda,I]=sort(diag(D),'ascend');
        Q=Q(I,I);
        %            [i1,i2]
        
        lambda=lambda/sum(sum(lambda));
        n5p=sum(lambda<0.05);
        if n5p>1
            Nbadr=1;
            dom_ov(i1,i2).cbbadmsr(1).phi=dom_ov(i1,i2).cbbadms(1).phi;
            for l=1:Nbad
                if lambda(l)>=0.05
                    Nbadr=Nbadr+1;
                    phir=0;
                    for k=1:Nbad
                        phir=phir+Q(k,l)*(dom_ov(i1,i2).cb(k).phi);
                    end
                    dom_ov(i1,i2).cbbadmsr(Nbadr).phi=phir;
                end
            end
            
        else
            for l=1:Nbad

                dom_ov(i1,i2).cbbadmsr(l).phi=dom_ov(i1,i2).cbbadms(l).phi;
                Nbadr=Nbad;
            end
        end
           dom_ov(i1,i2).Nbadr=Nbadr;
%            [Nbad,n5p,Nbadr]
%            pause
    end
end