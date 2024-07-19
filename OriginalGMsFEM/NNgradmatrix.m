function A=NNgradmatrix(M,v,mesh,k1perm)

% fprintf('Creating Sparse Matrices in subdomain \n');

% Cuadrature points in the reference triangle (See Braess)
%[xi,eta,omega]=setquadrature();


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
    lA=localAnormal(M(i,:),v,k1perm); % compute local part of A
    A(lcol,lcol)=A(lcol,lcol)+lA;
end

for i=2:2:mesh.ne
%   waitbar((i+mesh_f.ne)/(2*mesh_f.ne),h)
    %%%%%%%%%%%%%%%%%%  GLOBAL NUMBERING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    lcol=M(i,:);
     %%%%%%%%%%%%%%%%%%% VELOCITY*VLOCITY STIFNESS %%%%%%%%%%%%%%%%%%%%%
    lA=localAnormal(M(i,:),v,k1perm); % compute local part of A
    A(lcol,lcol)=A(lcol,lcol)+lA;
end