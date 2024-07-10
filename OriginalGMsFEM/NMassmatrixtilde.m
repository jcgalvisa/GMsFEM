function [A,b]=NMassmatrixtilde(M,v,mesh,k1perm,grad)


nvel=mesh.nv; % velocity degrees of freedom==number of vertices.
A=sparse(nvel,nvel);   % grad*grad   
b=sparse(nvel,1);       % right hand side part --->.
%Mul=sparse(npre,1);        % Lagrange multimplier to ensure zero pressure.

% odd loop
% h= waitbar(0,'Please wait...assambling stiffness');
for i=1:2:mesh.ne
%   waitbar(i/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(i,:); % subdomain indexes of bases.
    %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
     lA=localMasstilde(M(i,:),v,k1perm,grad(i)); % compute local part of A
%     lA=localMasstilde(M(i,:),v,mu,k1perm,grad); % compute local part of A
    A(lcol,lcol)=A(lcol,lcol)+lA;
    %%%%%%%%%%%%%%%%%%%% LOAD VECTOR         %%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%% LAGRANGE MULTIPLIER %%%%%%%%%%%%%%%%%%%%%%%
    %Mul(M_f(i,:),1)=Mul(M_f(i,:),1)+localmul(M_f(i,:),v_f,mesh_f,xi,eta,omega);
end

for i=2:2:mesh.ne
%   waitbar((i+mesh_f.ne)/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(i,:);
     %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lA=localMasstilde(M(i,:),v,k1perm,grad(i)); % compute local part of A
%    lA=localMasstilde(M(i,:),v,mu,k1perm,grad); % compute local part of A
    A(lcol,lcol)=A(lcol,lcol)+lA;
    %%%%%%%%%%%%%%%%%%%% LOAD VECTOR         %%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%% LAGRANGE MULTIPLIER %%%%%%%%%%%%%%%%%%%%%%%
%    Mul(M_f(i,:),1)=Mul(M_f(i,:),1)+localmul(M_f(i,:),v_f,mesh_f,xi,eta,omega);
end
