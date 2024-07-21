function neigh=neighborhoods(ax,bx,ay,by,Nx,Ny,nx,ny)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting coarse neighborhood info... \n');
%%%% hbar=waitbar(0,':(');
%%%% hbarn=0;
fprintf('...Fine mesh and dofs... \n');
for i1=1:Nx+1
    for i2=1:Ny+1
        [nodes_list_omegai,element_list_omegai]=createmeshomegai(nx,ny,Nx,Ny,i1,i2);
        neigh(i1,i2).nodes=nodes_list_omegai;
        neigh(i1,i2).elements=element_list_omegai;
        neigh(i1,i2).c=[ax+(i1-1)*(bx-ax)/Nx,ay+(i2-1)*(by-ay)/Ny];
        neigh(i1,i2).diam.x=(2)*(bx-ax)/Nx;
        neigh(i1,i2).diam.y=(2)*(by-ay)/Ny;
    end
end

