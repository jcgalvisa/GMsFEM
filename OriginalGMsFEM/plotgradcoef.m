%coarsetest
dom=piecewisecoeff2D(dom,Nx,Ny,mu,k1perm);
figure(5)
subplot(1,2,1)
plot_piecewisecoeff2Dgrad(E2C,dom,Nx,Ny);view(2); colorbar
subplot(1,2,2)
plot_piecewisecoeff2D(dom,Nx,Ny);view(2); colorbar
axis square
shading flat
