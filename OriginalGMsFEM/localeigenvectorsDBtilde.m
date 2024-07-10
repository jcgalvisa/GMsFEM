function dom_ov=localeigenvectorsDBtilde(x,dom_ov, Nx,Ny,add)

for i1=1:Nx+1
    for i2=1:Ny+1
        A=dom_ov(i1,i2).A;
        M=dom_ov(i1,i2).Masstilde;
        
%     Ig=dom_ov(i1,i2).Ig;
%             B=dom_ov(i1,i2).B;
%     bry=[B.vup;B.vleft;B.vdown;B.vright];
%     It=1:size(Ig,2);
%     G=unique(bry);
%     G2=G;
%     f=1;
% %     if (i1==1)
% %         G2=setdiff(G2,B.vleft);
% %         f=0;
% %     end
% %     if (i1==(Nx-1))
% %         G2=setdiff(G2,B.vright);
% %         f=0;
% %     end
% %     if (i2==1)
% %         G2=setdiff(G2,B.vdown);
% %         f=0;
% %     end
% %     if (i2==(Ny-1))
% %         G2=setdiff(G2,B.vup);
% %         f=0;
% %     end
%     G2=setdiff(G,G2);
% 
%     Ifree=setdiff(It,G2);
%     Afree=A(Ifree,Ifree);
%     Mfree=M(Ifree,Ifree);
%         
        
        
        [Q,D]=eig(full(A),full(M));
%        [Q,D]=eig(full(A));
        [lambda,I]=sort(diag(D),'ascend');
        Q=Q(I,I);
        Ig=dom_ov(i1,i2).Ig;
        nlambda=max(size(lambda));
        incre=diff(lambda);
        Iincre=incre>.05;
        I=1:nlambda-1;
        Ig90=I(Iincre);
         if size(Ig90,2)>=1
%         Nbad=1;
%         else
         Nbad=Ig90(1);
         else
             Nbad=1;
         end
%         end
%        Nbad=4;
%        Nbad=4;
        Nbad=Nbad+add;
        n=size(x,1);
        psi1=sparse(n,Nbad);
        psi1(Ig,1:(Nbad+1))=Q(:,1:(Nbad+1));
% %                 if i1==1 && (i2==3 || i2==4)
% %                     psi2=-psi2;
% %                 end
% %                 if i1==2 && (i2==1 || i2==2 || i2==4)
% %                     psi2=-psi2;
% %                 end
% %                 if i1==3 && (i2==2  || i2==4)
% %                     psi2=-psi2;
% %                 end
% %                 if i1==4 &&(  i2==3 ||i2==4 )
% %                     psi2=-psi2;
% %                 end
        dom_ov(i1,i2).psibadtilde=psi1;
        dom_ov(i1,i2).Nbadtilde=Nbad;
        dom_ov(i1,i2).lambdatilde=lambda;

        
        
    end
end
