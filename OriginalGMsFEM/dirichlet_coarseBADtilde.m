function x0d=dirichlet_coarseBADtilde(x0,dir,vC,L1)

x0d=0*x0;
X=vC(:,1);
Y=vC(:,2);
x0d_aux=boundary_condition(X,Y)./L1;
%x0d_aux=(X)*0;
x0d(dir)=x0d_aux;