%exp1

xf=x2L+xd;
Axf= applay_AN(xf,dom,Nx,Ny);
Mxf=applay_M(xf,dom,Nx,Ny);
Exf=full(dot(xf,Axf));
Hxf=norm_h1_global(xf,dom,Nx,Ny);
L2xf=norm_l2_global(xf,dom,Nx,Ny);
Mxf=full(dot(xf,Mxf));

%pEx=(x2L+xd).*Axf;
%Ex=1;

% % z0aux2L=apply_P0Bd(b,dom_ov,Nx,Ny,A0,d0,v0);
% % E2L=z0aux2L-x2L-xd;
% % AE2L= applay_AN(E2L,dom,Nx,Ny);
% % ee2L=full(dot(E2L,AE2L))/Ex;

colormap("jet")

z0auxMS=apply_P0MSBd(b,dom_ov,Nx,Ny,A0MS,d0MS,v0MS);
EMS=z0auxMS-xf;
AEMS= applay_AN(EMS,dom,Nx,Ny);
MEMS= applay_M(EMS,dom,Nx,Ny);
eeMS=full(dot(EMS,AEMS))/Exf;
eMMS=full(dot(EMS,MEMS))/Mxf;
ehMS=norm_h1_global(EMS,dom,Nx,Ny)/Hxf;
el2MS=norm_l2_global(EMS,dom,Nx,Ny)/L2xf;

z0auxEM=apply_P0EMFBd(b,dom_ov,Nx,Ny,A0EMF,d0EMF,v0EMF);
EEM=z0auxEM-xf;
AEEM= applay_AN(EEM,dom,Nx,Ny);
MEEM= applay_M(EEM,dom,Nx,Ny);
eeEM=full(dot(EEM,AEEM))/Exf;
eMEM=full(dot(EEM,MEEM))/Mxf;
ehEM=norm_h1_global(EEM,dom,Nx,Ny)/Hxf;
el2EM=norm_l2_global(EEM,dom,Nx,Ny)/L2xf;

z0aux2C=apply_P0BADBd(b,dom_ov,Nx,Ny,A02C,d02C,d02Cn,v02C,P1);
E2C=z0aux2C-xf;
AE2C= applay_AN(E2C,dom,Nx,Ny);
ME2C= applay_M(E2C,dom,Nx,Ny);
ee2C=full(dot(E2C,AE2C))/Exf;
eM2C=full(dot(E2C,ME2C))/Mxf;
eh2C=norm_h1_global(E2C,dom,Nx,Ny)/Hxf;
el22C=norm_l2_global(E2C,dom,Nx,Ny)/L2xf;


z0aux2CMS2=apply_P0BADMS2Bd(b,dom_ov,Nx,Ny,A02CMS2,d02CMS,d02CMSn,v02CMS,P1MS);
E2CMS2=z0aux2CMS2-xf;
AE2CMS2= applay_AN(E2CMS2,dom,Nx,Ny);
ME2CMS2= applay_M(E2CMS2,dom,Nx,Ny);
ee2CMS2=full(dot(E2CMS2,AE2CMS2))/Exf;
eM2CMS2=full(dot(E2CMS2,ME2CMS2))/Mxf;
eh2CMS2=norm_h1_global(E2CMS2,dom,Nx,Ny)/Hxf;
el22CMS2=norm_l2_global(E2CMS2,dom,Nx,Ny)/L2xf;


z0auxR=apply_P0BADMSrBd(b,dom_ov,Nx,Ny,A02Cr,d02Cr,d02Crn,v02Cr,P1r);
ER=z0auxR-xf;
AER= applay_AN(ER,dom,Nx,Ny);
MER= applay_M(ER,dom,Nx,Ny);
eeR=full(dot(ER,AER))/Exf;
eMR=full(dot(ER,MER))/Mxf;
ehR=norm_h1_global(ER,dom,Nx,Ny)/Hxf;
el2R=norm_l2_global(ER,dom,Nx,Ny)/L2xf;



z0auxRtilde=apply_P0BADBdtilde(b,dom_ov,Nx,Ny,A02Ctilde,dir2Ctilde,dirn2Ctilde,vC2Ctilde,P12Ctilde);
ERtilde=z0auxRtilde-xf;
AERtilde= applay_AN(ERtilde,dom,Nx,Ny);
MERtilde= applay_M(ERtilde,dom,Nx,Ny);
eeRtilde=full(dot(ERtilde,AERtilde))/Exf;
eMRtilde=full(dot(ERtilde,MERtilde))/Mxf;
ehRtilde=norm_h1_global(ERtilde,dom,Nx,Ny)/Hxf;
el2Rtilde=norm_l2_global(ERtilde,dom,Nx,Ny)/L2xf;



figure(1)
subplot(2,2,1) 
%plot_vector(-z0aux2L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(xf, dom,Nx,Ny,coefficient_values); title(['Fine scale sol (',num2str(size(x2L,1)),')']) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(z0auxMS, dom,Nx,Ny,coefficient_values); title(['MS(',num2str(size(A0MS,1)),'), |e|_A=',num2str(eeMS),'   |e|_1=',num2str(ehMS)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,3) 
plot_vector(z0auxEM, dom,Nx,Ny,coefficient_values); title(['EMF(',num2str(size(A0EMF,1)),'), |e|_A=',num2str(eeEM),'  |e|_1=',num2str(ehEM)]) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(z0aux2C, dom,Nx,Ny,coefficient_values); title(['LSM_1(',num2str(size(A02C,1)),'), |e|_A=',num2str(ee2C),'   |e|_1=',num2str(eh2C)]) ;view(2)
shading flat; colorbar; axis square



figure(2)
subplot(2,2,1) 
% plot_vector(-z02L, dom,Nx,Ny,mu,k'); title(['LIN, E-ERR0R=',num2str(ee2L)]) ;view(2)
plot_vector(x2L+xd, dom,Nx,Ny,coefficient_values); title(['Fine scale sol (',num2str(size(x2L,1)),')']) ;view(2)
shading flat; colorbar; axis square
subplot(2,2,2) 
plot_vector(z0aux2C, dom,Nx,Ny,coefficient_values); title(['LSM_1(',num2str(size(A02C,1)),'), |e|_A=',num2str(ee2C),'   |e|_1=',num2str(eh2C)]) ;view(2)
shading flat; colorbar; axis square
 subplot(2,2,3) 
  plot_vector(z0aux2CMS2, dom,Nx,Ny,coefficient_values); title(['LSM-RE(',num2str(size(A02CMS2,1)),'), |e|_A=',num2str(ee2CMS2),'   |e|_1=',num2str(eh2CMS2)]) ;view(2)
 shading flat; colorbar; axis square
subplot(2,2,4) 
plot_vector(z0auxR, dom,Nx,Ny,coefficient_values); title(['RLSM(',num2str(size(A02Cr,1)),'), |e|_A=',num2str(eeR),'   |e|_1=',num2str(ehR)]) ;view(2)
shading flat; colorbar; axis square

figure(10)
plot_vector(z0auxRtilde, dom,Nx,Ny,coefficient_values); title(['RLSM(',num2str(size(A02Ctilde,1)),'), |e|_A=',num2str(eeRtilde),'   |e|_1=',num2str(ehRtilde)]) ;view(2)
shading flat; colorbar; axis square



EnergyE=[eeMS, eeEM, ee2C, ee2CMS2, eeR];
L2weigE=[eMMS, eMEM, eM2C, eM2CMS2, eMR];
H1E=[ehMS, ehEM, eh2C, eh2CMS2, ehR];
L2E=[el2MS, el2EM, el22C, el22CMS2, el2R];



% EnergyE=[eeMS, ee2C, eeRtilde];
% L2weigE=[eMMS,  eM2C, eMRtilde];
% H1E=[ehMS, eh2C, ehRtilde];
% L2E=[el2MS, el22C, el2Rtilde];

tb(1,additional_basis+1).EnergyE=EnergyE;
tb(1,additional_basis+1).L2weigE=L2weigE;
tb(1,additional_basis+1).H1E=H1E;
tb(1,additional_basis+1).L2E=L2E;
tb(1,additional_basis+1).dim2C=size(A02C,2);
tb(1,additional_basis+1).dim2Ctilde=size(A02Ctilde,2);



% % % 
% save perm2NnewBcaorse8x102.mat
 
%  %perm3caorse.mat
%   perm2forplot.mat 
%  perm3NBcaorse8x10.mat
%  permreadperm.mat
%  perm2caorse.mat 
%   perm2NBcaorse8x10.mat