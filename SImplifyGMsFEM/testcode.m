% Domain and mesh parameters
ax=0;bx=1;ay=0;by=1;
Nx=10; Ny=Nx;
nx=10;ny=nx;
intx=[0,4];
inty=[0,1];
add=1;

% mesh informaition
[Element_list, Boundary,vertex_list,mesh_parameter,h,boundary_nodes,free]=square_mesh(nx,ny,Nx,Ny,intx,inty);


% coefficient (it is a vector with the coefficient values in each element).
% coefficient value is added to the triangulation information, 
Coefficient_values=rand((Nx*nx*Ny*ny),1);
Elements=[Element_list,Coefficient_values];

% Stiffness and load vector in the fine mesh
[Afinegrid,bfinegrid]=Nmatrix(Elements,vertex_list,mesh_parameter);
% Mass matrix in the fine grid (if needed)
%Mfinegrid=NMassmatrix(Elements,vertex_list,mesh_parameter);

% Information realted to coarse grid neighborhoods
neigh=neighborhoods(ax,bx,ay,by,Nx,Ny,nx,ny);

% compuation of local eigenvalue problems
% of this coputation it is need to assamble local stiffness and mass matrix
% with neuman boundary condition in each neighboorhood
neigh=localeigenvectors(bfinegrid*0,neigh, Nx,Ny,add,Elements,vertex_list,mesh_parameter);
neigh=linearones(neigh,Nx,Ny,bfinegrid,vertex_list);

% computation of GMsFEM basis
neigh=GMsFEMbasis(neigh,Nx,Ny);

% computaiton of GMsFEM coarse matrix and coarse load vector
[R0GMsFEM,free0G,x0dG]=matrixR_GMsFEM(bfinegrid,neigh,Nx,Ny);
A0GMsFEM=R0GMsFEM'*Afinegrid*R0GMsFEM;
b0G=R0GMsFEM'*bfinegrid-A0GMsFEM*x0dG;

% compuation of GMsFEM approximation of the pressure
downz0G=compute_GMsFEMpressure(A0GMsFEM,b0G,R0GMsFEM,free0G,x0dG);

%plot_vector(downz0G, dom,Nx,Ny,coefficient_values); title(['GMsFEM pressure']) ;view(2); shading flat
figure(1)
imagesc(reshape(downz0G,Nx*nx+1,Ny*ny+1)')

% postprocessing of the preassure for elements
pelement=compute_pressure_at_elements(downz0G, Nx,Ny,nx,ny);
figure(2)
imagesc(reshape(pelement,Nx*nx,Ny*ny)')

figure(3)
subplot(1,2,1)
surf(reshape(Elements(:,5),Nx*nx,Ny*ny)')
view(2)
title("coefficient")
axis square
subplot(1,2,2)
surf(reshape(pelement,Nx*nx,Ny*ny)')
view(2)
title("pressure")
axis square



