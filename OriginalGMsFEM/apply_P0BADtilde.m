function w=apply_P0BADtilde(x,dom_ov,Nx,Ny,A0)

x0=apply_R0BADtilde(x,dom_ov,Nx,Ny);
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
w0=A0\x0;
w=apply_R0BADtilde_T(w0,dom_ov,Nx,Ny);