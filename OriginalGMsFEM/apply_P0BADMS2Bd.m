function w=apply_P0BADMS2Bd(x,dom_ov,Nx,Ny,A0,dir,dirn,vC,L1)

x0=apply_R0BADMS2B(x,dom_ov,Nx,Ny);

x0d=dirichlet_coarseBAD(x0,dirn,vC,L1);
%whos x0d A0
rhs=x0-A0*x0d;
n=size(A0,2);
I=1:n;
free=setdiff(I,dir);
w0=0*x0;
w0(dir)=x0d(dir);
w0(free)=A0(free,free)\rhs(free);



w=apply_R0BADMS2B_T(w0,dom_ov,Nx,Ny);