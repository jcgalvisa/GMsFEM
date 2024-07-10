function plot_eigenvalues(x,Q,lambda,dom,Nx,Ny,mu,k1perm)


for i=1:max(size(x))
eigenvec=Q(:,i)+0*x;
    plot_vector(lambda(i)*eigenvec, dom,Nx,Ny,mu,k1perm); %view(2); colorbar
    
%    view(2)
   % shading interp
    axis square
    r=lambda(i);
    title([i, r])
    hold off
    pause
end
