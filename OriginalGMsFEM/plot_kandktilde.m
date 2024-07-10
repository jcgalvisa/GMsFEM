
 Min=1;
 Max=10^n;
my_clim = [Min Max];

figure(1)

plot_piecewisecoeff2D(dom,Nx,Ny); view(2)
colormap(jet(1024)), caxis(my_clim)
shading flat
axis square
colorbar
figure(2)

plot_piecewisecoefftilde2D(dom,Nx,Ny); view(2)
colormap(jet(1024)), caxis(my_clim)
shading flat
axis square
colorbar
figure(3)
 plot_mesh(dom,Nx,Ny)
 axis square
 colorbar


