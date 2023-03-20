function [blocklist,omegalist,b,bnew,xd]=coarsemeshOriginalGMsFEM(ax,bx,ay,by,Nx,Ny,nx,ny,coefficient_values,max_it,tol,additional_basis)



%Coarse neighborhoods
omegalist=neighborhoods(ax,bx,ay,by,Nx,Ny,nx,ny,coefficient_values);


[blocklist,b]=blocks(ax,bx,ay,by,Nx,Ny,nx,ny,coefficient_values);

w=createlinear(b,blocklist,Nx,Ny);
%w=w*0;
xd=w-zerodir(w,blocklist,Nx,Ny);

Axd=applay_AN(xd,blocklist,Nx,Ny);
Axd=zerodir(Axd,blocklist,Nx,Ny);
bnew=b-Axd;
%bnew=applay_Aadd_inv2_NB(bnew,dom,dom_ov,Nx,Ny);

%dom=piecewisecoeff2D(dom,Nx,Ny,mu);
%vones=createone(b,dom,Nx,Ny);
omegalist=localeigenvectors(b,omegalist, Nx,Ny,additional_basis);

omegalist=linearones(blocklist,omegalist,Nx,Ny,b);
omegalist=linearones2(blocklist,omegalist,Nx,Ny,b);
omegalist=linearms(blocklist,omegalist,Nx,Ny,b);
%dom_ov=linearms(blocklist,omegalist,Nx,Ny,b);

[omegalist,iterlambdaEMF]=emfB(blocklist,omegalist,Nx,Ny,b,coefficient_values);
%[dom_ov,iterlambdaEMAM]=emfAM(blocklist,omegalist,Nx,Ny,b);
omegalist=emfpuK22B(blocklist,omegalist,Nx,Ny,b);
omegalist=emfpuK22MSB(blocklist,omegalist,Nx,Ny,b);
omegalist=emfBADmsB(blocklist,omegalist,Nx,Ny,b);
omegalist=emfBADmsreducedB(blocklist,omegalist,Nx,Ny,b);

% 
% fprintf('Mass matrix tilde.... ');
% omegalist=Mtilde_ov(blocklist,omegalist,Nx,Ny,coefficient_values);
% omegalist=Mtilde_ovEM(blocklist,omegalist,Nx,Ny,coefficient_values);
% fprintf('Done\n');

%fprintf('Local eigenvectors with Mtilde... ');
%omegalist=localeigenvectorsDBtilde(b,omegalist, Nx,Ny,additional_basis);
%omegalist=localeigenvectorsDBtildeEM(b,omegalist, Nx,Ny,additional_basis);
%fprintf('Done\n');

%omegalist=emfpuK22DBtilde(blocklist,omegalist,Nx,Ny,b);
%omegalist=emfpuK22DBtildeEM(blocklist,omegalist,Nx,Ny,b);


% % % % % [A0,d0,v0]=coarse_matrix(dom,dom_ov,Nx,Ny);
% % % % % [A0MS,d0MS,v0MS]=coarse_matrix_MS(dom,dom_ov,Nx,Ny);
% % % % % [A0EMF,d0EMF,v0EMF]=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);
% % % % % %A0EMAM=coarse_matrix_EMAM(dom,dom_ov,Nx,Ny);
% % % % % [A02C,d02C,d02Cn,vO2C,L1]=coarse_matrixBAD(dom,dom_ov,Nx,Ny);
% % % % % [A02CMS,d02CMS,d02CMSn,v02CMS]=coarse_matrixBADMS(dom,dom_ov,Nx,Ny);
% % % % % [A02CMS2,d02CMS2,d02CMS2n,v02CMS2]=coarse_matrixBADMStwo(dom,dom_ov,Nx,Ny);
% % % % % [A02Cr,d02Cr,d02Crn,v02Cr]=coarse_matrixBADMSrB(dom,dom_ov,Nx,Ny);



%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, tol,dom,Nx,Ny);
%bdaux=datadirnew(0*b,dom,Nx,Ny);
%bd=b*0-applay_AN(bdaux,dom,Nx,Ny);
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0,b,b, max_it, tol,dom,dom_ov,Nx,Ny);


%[x2, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
%xp=x2;
%[x, error, iter, flag, lambdamax, condnumber] = Apcg(b*0, x,b, max_it, tol,dom,dom_ov,Nx,Ny);

%plot_vector(b,dom,Nx,Ny)