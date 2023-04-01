
fprintf('Reference solution norms...\n');
Euref=sqrt(full(dot(uref,Afinegrid*uref)));
wL2uref=sqrt(full(dot(uref,Massfinegrid*uref)));

fprintf('Q1  solution...\n');

z0aux=A0(free0,free0) \b0(free0MS);
z0=x0d;
z0(free0)=z0aux;
downz0=R0*z0;
E=downz0-uref;
ee=sqrt(full(dot(E,Afinegrid*E)))/Euref;
eM=sqrt(full(dot(E,Massfinegrid*E)))/wL2uref;



fprintf('Classical Ms solution...\n');

z0auxMS=A0MS(free0MS,free0MS) \b0MS(free0MS);
z0MS=x0dMS;
z0MS(free0MS)=z0auxMS;
downz0MS=R0MS*z0MS;
EMS=downz0MS-uref;
eeMS=sqrt(full(dot(EMS,Afinegrid*EMS)))/Euref;
eMMS=sqrt(full(dot(EMS,Massfinegrid*EMS)))/wL2uref;


fprintf('Classical GMsFEM solution...\n');

z0auxG=A0GMsFEM(free0G,free0G) \b0G(free0G);
z0G=x0dG;
z0G(free0G)=z0auxG;
downz0G=R0GMsFEM*z0G;
EG=downz0G-uref;
eeG=sqrt(full(dot(EG,Afinegrid*EG)))/Euref;
eMG=sqrt(full(dot(EG,Massfinegrid*EG)))/wL2uref;









fprintf('Plots...\n');

colormap("jet")

figure(1)
subplot(2,2,1) 
plot_vector(uref, dom,Nx,Ny,coefficient_values); title(['Fine scale sol (',num2str(size(uref,1)),')']) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(downz0, dom,Nx,Ny,coefficient_values); title(['Q1 sol (',num2str(size(A0,1)),')']) ;view(2)
shading flat; colorbar; axis square


subplot(2,2,3) 
plot_vector(downz0MS, dom,Nx,Ny,coefficient_values); title(['MS(',num2str(size(A0MS,1)),'), |e|_A=',num2str(eeMS)   ]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(downz0G, dom,Nx,Ny,coefficient_values); title(['GMsFEM(',num2str(size(A0GMsFEM,1)),'), |e|_A=',num2str(eeG)]) ;view(2)
shading flat; colorbar; axis square




