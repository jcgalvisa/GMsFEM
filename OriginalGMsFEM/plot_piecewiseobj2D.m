function plot_piecewiseobj2D(Vel,dom,Nx,Ny,mu,k1perm)
% function plot_vector(u,dom,Nx,Ny)
color=0;

for i1=1:Nx
    for i2=1:Ny
        color=color+1;
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        %        col=dom(i1,i2).Ig;
        coeff=log(Vel(i1,i2).energy);
        ne=dom(i1,i2).mesh.ne;
        for j=1:ne
            color=Ny*(i1-1)+i2;
            trisurf([1,2,3],v(M(j,:),1),v(M(j,:),2), [(coeff(j));(coeff(j));(coeff(j))] );
%            trisurf([1,2,3],v(M(j,:),1),v(M(j,:),2) );
            hold on
        end
    end
end

