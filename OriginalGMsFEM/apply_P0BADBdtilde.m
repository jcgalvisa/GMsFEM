function w=apply_P0BADBdtilde(b,dom_ov,Nx,Ny,A0,dir,dirn,vC,L1)

x0=apply_R0BADtilde(b,dom_ov,Nx,Ny);


x0d=dirichlet_coarseBAD(x0,dirn,vC,L1);

rhs=x0-A0*x0d;
n=size(A0,2);
I=1:n;
free=setdiff(I,dir);
w0=0*x0;
w0(dirn)=x0d(dirn);
w0(free)=A0(free,free)\rhs(free);

%  b=x0;
%  Nvar=(Nx-1)*(Ny-1);
%  I=1:Nvar;
%  A11=A0(I,I);
%  A12=A0(I,I+Nvar);
%  A21=A0(I+Nvar,I);
%  A22=A0(I+Nvar,I+Nvar);
%  b1=b(I);b2=b(I+Nvar);
%  S=A22-A21*(A11\A12);
%  b2new=b2-A21*(A11\b1);
% % x2=S\b2new;
% %x2=A22\b2;
% %x1=A11\(b1-A12*x2);
% %x1=(A11\b1);
%w0=[x1;x2];
%w0=A0\x0;
w=apply_R0BADtilde_T(w0,dom_ov,Nx,Ny);