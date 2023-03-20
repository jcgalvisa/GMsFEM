function dom=neighborhoods(ax,bx,ay,by,Nx,Ny,nx,ny,coefficient_values)

%mesh_info
hx=(bx-ax)/(Nx*nx);
hy=(by-ay)/(Ny*ny);

Hx=(bx-ax)/Nx;
Hy=(by-ay)/Ny;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Setting coarse neighborhood info... \n');
%%%% hbar=waitbar(0,':(');
%%%% hbarn=0;
intx=[ax,bx];
inty=[ay,by];
for i1=1:Nx+1
    for i2=1:Ny+1
     %%%   hbarn=hbarn+1;
     %%%    waitbar(hbarn/(Nx*Ny),hbar);
        intx=[ax+(i1-2+(i1==1))*(bx-ax)/Nx,ax+(i1-(i1==(Nx+1)))*(bx-ax)/Nx];
        inty=[ay+(i2-2+(i2==1))*(by-ay)/Ny,ay+(i2-(i2==(Ny+1)))*(by-ay)/Ny];
        [M,B,v,mesh,h,Igfree,Ig,free]=createmeshomegai(nx,ny,intx,inty,Nx,Ny,i1,i2);
        dom(i1,i2).M=M;
        dom(i1,i2).B=B;
        dom(i1,i2).v=v;
        dom(i1,i2).mesh=mesh;
        dom(i1,i2).h=h;
        dom(i1,i2).Ig=Ig;
        dom(i1,i2).Igfree=Igfree;
        dom(i1,i2).c=[ax+(i1-1)*(bx-ax)/Nx,ay+(i2-1)*(by-ay)/Ny];
        dom(i1,i2).diam.x=(2)*(bx-ax)/Nx;
        dom(i1,i2).diam.y=(2)*(by-ay)/Ny;
        dom(i1,i2).free=free;
    end
end
%%% close(hbar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
nvel=(Nx*nx+1)*(Ny*ny+1);
b=sparse(nvel,1);
%%% hbarn=0;
%%% hbar=waitbar(0,':(');
for i1=1:Nx+1
    for i2=1:Ny+1
    %%%    hbarn=hbarn+1;
    %%%    waitbar(hbarn/(Nx*Ny),hbar);
        M=dom(i1,i2).M;
        v=dom(i1,i2).v;
        mesh=dom(i1,i2).mesh;
        %free=dom(i1,i2).free;
        
        [Asd,bsd]=Nmatrix(M,v,mesh,coefficient_values);
        Massd=NMassmatrix(M,v,mesh,coefficient_values);
        Ngrad=NNgradmatrix(M,v,mesh,coefficient_values);
        dom(i1,i2).Ngrad=Ngrad;
        dom(i1,i2).Mass=Massd;

        dom(i1,i2).A=Asd;
    end
end
%%% close(hbar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

