function x0d=dirichlet_coarse(x0,dir,vC)

x0d=0*x0;
X=vC(:,1);
Y=vC(:,2);
x0d_aux=boundary_condition(X,Y);
%x0d_aux=X*0;
x0d(dir)=x0d_aux;