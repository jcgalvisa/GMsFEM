function neigh=localeigenvectors(x,neigh, Nx,Ny,add,Elements,vertex_list,mesh_parameter)

for i1=1:Nx+1
    for i2=1:Ny+1
        nodes_i=neigh(i1,i2).nodes;
        elements_i=neigh(i1,i2).elements;
        Ai=Nmatrix(Elements(elements_i,:),vertex_list,mesh_parameter);
        Mi=NMassmatrix(Elements(elements_i,:),vertex_list,mesh_parameter);
        Ai=Ai(nodes_i,nodes_i);
        Mi=Mi(nodes_i,nodes_i);
        [Q,D]=eig(full(Ai),full(Mi));
%        [Q,D]=eig(full(A));
        [lambda,I]=sort(diag(D),'ascend');
        Q=Q(I,I);
        nlambda=max(size(lambda));
        incre=diff(lambda);
        Iincre=incre>2;
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
%        Nbad=2;
        Nbad=Nbad+add;
        n=size(x,1);
        psi1=sparse(n,Nbad);
        psi1(nodes_i,1:(Nbad+1))=Q(:,1:(Nbad+1));
        %if (i1==1 || i1==Nx || i2==1 || i2==Ny )
         %   Nbad=1;
        %end
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
        neigh(i1,i2).psibad=psi1;
%         [i1,i2]
%         psi1(1,1)
%         lambda(1:3)
%         pause
        neigh(i1,i2).Nbad=Nbad;
        neigh(i1,i2).lambda=lambda;

        
        
    end
end
