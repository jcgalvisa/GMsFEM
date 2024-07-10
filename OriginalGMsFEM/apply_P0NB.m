function w=apply_P0NB(x,dom_ov,Nx,Ny,A0,dir,vC)

x0=apply_R0B(x,dom_ov,Nx,Ny);
%x0d=dirichlet_coarse(x0,dir,vC);
%whos x0d A0
%rhs=x0-A0*x0d;
n=size(A0,2);
I=1:n;
free=setdiff(I,dir);
w0=0*x0;
w0(dir)=0;
w0(free)=A0(free,free)\x0(free);
w=apply_R0B_T(w0,dom_ov,Nx,Ny);