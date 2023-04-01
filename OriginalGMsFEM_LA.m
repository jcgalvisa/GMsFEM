
contrast_value=10^4; 

coefficient_values=generatecoefficient2(contrast_value);


max_it=2000;
tol=1e-6;

% The doman is [0,1]x[0,1]. keep this domain.
ax=0;bx=1;ay=0;by=1;
% Number of coarse blocks in the x and y direction
Nx=5; Ny=Nx;
% Number of fine-grid elements in each coarse block
nx=5; ny=nx;


%number of additional basis functions for all coarse nodes neighborhoods
% these are on top of need basis fucntions according to spectral gap
% In total it used additional_basis+spectral_gap_basis
additional_basis =5;


% all informaion neede for coarse blocks 
% and coarse neighborhoods
[dom,dom_ov,b,bnew,xd]=coarsemeshOriginalGMsFEM(ax,bx,ay,by,Nx,Ny,nx,ny,coefficient_values,max_it,tol,additional_basis);


[Afinegrid,Massfinegrid, free]=FineGridNMatrix(b,dom,Nx,Ny);
bd=b-Afinegrid*xd;

fprintf('Q1 Coarse Matrix...\n');
[R0,free0,x0d]=matrixR(b,dom_ov,Nx,Ny);
A0=R0'*Afinegrid*R0;
b0=R0'*b-A0*x0d;

fprintf('MsFEM Coarse Matrix...\n');
[R0MS,free0MS,x0dMS]=matrixR_MS(b,dom_ov,Nx,Ny);
A0MS=R0MS'*Afinegrid*R0MS;
b0MS=R0MS'*b-A0MS*x0dMS;

fprintf('GMsFEM Coarse Matrix...\n');

[R0GMsFEM,free0G,x0dG]=matrixR_GMsFEM(b,dom_ov,Nx,Ny);

A0GMsFEM=R0GMsFEM'*Afinegrid*R0GMsFEM;
b0G=R0GMsFEM'*b-A0GMsFEM*x0dG;



fprintf('Reference solution using backslash... \n');
uaux=Afinegrid(free,free)\bd(free);
uref=xd;
uref(free)=uaux;

fprintf('Coarse solutions and comparison... \n');

coarsetest_OriginalGMsFEM
pause(0.2)
