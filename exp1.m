
highcontrast=10^4; %contrast
% next script generates coefficient_values
generatecoefficient

max_it=2000;
tol=1e-10;

% The doman is [0,1]x[0,1]. keep this domain.
ax=0;bx=1;ay=0;by=1;
% Number of coarse blocks in the x and y direction
Nx=10; Ny=Nx;
% Number of fine-grid elements in each coarse block
nx=10; ny=nx;


%number of additional basis functions for all coarse nodes neighborhoods
additional_basis =1;


% all informaion neede for coarse blocks 
% and coarse neighborhoods
[dom,dom_ov,b,bnew,xd]=coarsemesh(ax,bx,ay,by,Nx,Ny,nx,ny,coefficient_values,max_it,tol,additional_basis);

[A0,d0,v0]=coarse_matrix(dom,dom_ov,Nx,Ny);

[A0MS,d0MS,v0MS]=coarse_matrix_MS(dom,dom_ov,Nx,Ny);

[A0EMF,d0EMF,v0EMF]=coarse_matrix_EMF(dom,dom_ov,Nx,Ny);

%A0EMAM=coarse_matrix_EMAM(dom,dom_ov,Nx,Ny);

[A02C,d02C,d02Cn,v02C,P1]=coarse_matrixBAD(dom,dom_ov,Nx,Ny);

[A02CMS,d02CMS,d02CMSn,v02CMS,P1MS]=coarse_matrixBADMS(dom,dom_ov,Nx,Ny);

[A02CMS2,d02CMS2,d02CMS2n,v02CMS2,P1MS2]=coarse_matrixBADMStwo(dom,dom_ov,Nx,Ny);

[A02Cr,d02Cr,d02Crn,v02Cr,P1r]=coarse_matrixBADMSrB(dom,dom_ov,Nx,Ny);

fprintf('Reduced-LSM, ');
[A02Ctilde,dir2Ctilde,dirn2Ctilde,vC2Ctilde,P12Ctilde]=coarse_matrixBADtilde(dom,dom_ov,Nx,Ny);

fprintf('LSMtilde, ');
A02CtildeEM=coarse_matrixBADtildeEM(dom,dom_ov,Nx,Ny);
fprintf('LSMtildeEM, ');

%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, 2*max_it, tol,dom,Nx,Ny);
%sol=3*dom_ov(2,2).philin+dom_ov(4,4).phiEM;
%b=applay_A(sol,dom,Nx,Ny);

%[x, error, iter, flag, lambdamax, condnumber] = Acg(b*0, b,b, max_it, 2*tol,dom,Nx,Ny,mu);
% [x1L, error1L, iter1L, flag1L, lambdamax1L, condnumber1L] = Apcg(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny);
 [x2L, error2L, iter2L, flag2L, lambdamax2L, condnumber2L] = Apcg_ADD_2L(b*0, bnew,bnew, max_it, tol,dom,dom_ov,Nx,Ny,A0,d0);
% [xMS, errorMS, iterMS, flagMS, lambdamaxMS, condnumberMS] = Apcg_ADD_2LMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0MS);
% [xEM, errorEM, iterEM, flagEM, lambdamaxEM, condnumberEM] = Apcg_ADD_2LEMF(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMF);
%[xAM, errorAM, iterAM, flagAM, lambdamaxAM, condnumberAM] = Apcg_ADD_2LEMAM(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A0EMAM);
% [x2C, error2C, iter2C, flag2C, lambdamax2C, condnumber2C] = Apcg_ADD_2LtwoC(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02C);
% [x2CMS, error2CMS, iter2CMS, flag2CMS, lambdamax2CMS, condnumber2CMS] = Apcg_ADD_2LtwoCMS(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS);
% [x2CMS2, error2CMS2, iter2CMS2, flag2CMS2, lambdamax2CMS2, condnumber2CMS2] = Apcg_ADD_2LtwoCMS2(b*0, b,b, max_it, tol,dom,dom_ov,Nx,Ny,mu,A02CMS2);

%save solutions.mat xMS x2L xEM x2C

%[iter,iter1L, iter2L, iterEMF]
%iterlambdaEMF
% % % Siter(exponent,:)=[mu, iter1L, iter2L,iterMS,  iterEM,iter2C,iter2CMS,iter2CMS2]
% % % % Siter(n,N)=iter2L;
% % % 
% % % Scond(exponent,:)=[condnumber1L,condnumber2L,condnumberMS,condnumberEM,condnumber2C, condnumber2CMS,condnumber2CMS2 ];
% % % %Scond(n,N)=condnumber2L;
% % % %Slmax(exponent,:)=[lambdamax1L,lambdamax2L, lambdamaxMS];
% % % %dom=piecewisecoeff2D(dom,Nx,Ny,mu,[])
% % % tb.iter=Siter;
% % % % tb.lambmax=Slmax;
% % %  tb.cond=Scond;
% % %  tb.dom=dom;
% % % % tb.iterlambdaEMF=iterlambdaEMF;
% % % 
% % % tb.Nx=Nx,
% % % tb.Ny=Ny;
% % % % IN resultnew3.mat is the result with the new 
% % % % perm of exp1.
% % % 
% % % save resultperm2.mat tb dom
% % % %save resultnew5.mat tb dom
% % % %save resultnew6.mat tb dom
% % % 
% % % %save Inclusions.mat tb 
% % % 
% % % 
% % % badeig
% % % lambdaL(n)=min(min(nexttobad));
% % % Constant(n)=Nx^2/lambdaL(n);    
coarsetest
pause(0.2)

%end
%    end
%end
% 
% for n=1:4
%     for N=1:4
%         fprintf('%d (%.2f) &   ', Siter(n,N),Scond(n,N))
%         
%     end
%             fprintf('\n  ', Iter(n,N),Cond(n,N))
% 
% end
% 
% %end 
% 

save addtest1
