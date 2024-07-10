function [A,b]=NMassmatrix(M,v,mesh)


nvel=mesh.nv; % velocity degrees of freedom==number of vertices.
A=sparse(nvel,nvel);   % grad*grad   
b=sparse(nvel,1);       % right hand side part --->.
%Mul=sparse(npre,1);        % Lagrange multimplier to ensure zero pressure.

% odd loop
% h= waitbar(0,'Please wait...assambling stiffness');
for i=1:length(M)
%   waitbar(i/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(i,1:4); % subdomain indexes of bases.
    %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lA=localMass(M(i,1:4),v); % compute local part of A
    A(lcol,lcol)=A(lcol,lcol)+M(i,5)*lA;
    %%%%%%%%%%%%%%%%%%%% LOAD VECTOR         %%%%%%%%%%%%%%%%%%%%%%%%%%
end


