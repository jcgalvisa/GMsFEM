% Domain and mesh parameters
ax=0;bx=1;ay=0;by=1;
Nx=10; Ny=Nx;
nx=10;ny=nx;
intx=[ax,bx];
inty=[ay,by];
add=5; %number of additional basis functions

% mesh informaition
[Element_list, Boundary,vertex_list,mesh_parameter,h,boundary_nodes,free]=square_mesh(nx,ny,Nx,Ny,intx,inty);


% coefficient (it is a vector with the coefficient values in each element).
% coefficient must be of size Nx*nx*Ny*ny.
% coefficient value is added to the triangulation information, 
%Coefficient_values=0*rand((Nx*nx*Ny*ny),1)+1;
example_coefficient
Coefficient_values=k(:);
Elements=[Element_list,Coefficient_values];

% Stiffness and load vector in the fine mesh
[Afinegrid,bfinegrid]=Nmatrix(Elements,vertex_list,mesh_parameter);
% Mass matrix in the fine grid (if needed)
%Mfinegrid=NMassmatrix(Elements,vertex_list,mesh_parameter);

%Computation of the fine scale solution
Xf=vertex_list(:,1);
Yf=vertex_list(:,2);
xdfinegrid=boundary_condition(Xf,Yf);%./P1;
bfinegrid2=bfinegrid-Afinegrid*xdfinegrid;
zfine=bfinegrid2*0;
zfine(free)=Afinegrid(free,free)\bfinegrid2(free);
zfine=zfine+xdfinegrid;

Zf=reshape(zfine,Nx*nx+1,Ny*ny+1)';
Xf=reshape(Xf,Nx*nx+1,Ny*ny+1)';
Yf=reshape(Yf,Nx*nx+1,Ny*ny+1)';

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
Z0G=reshape(downz0G,Nx*nx+1,Ny*ny+1)';

figure(1)
subplot(2,1,1)
title('Fine scale  solution')
surf(Xf,Yf,Zf)
subplot(2,1,2)
surf(Xf,Yf,Z0G)
title('GMsFEM solution ( -basis)',add)

Error=zfine-downz0G;
nError= sqrt(dot(Afinegrid*Error,Error)/dot(Afinegrid*zfine,zfine));
fprintf('The error is %f Percent \n',100*full(nError))


