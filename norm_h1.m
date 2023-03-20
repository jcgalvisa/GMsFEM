function eh1=norm_h1(u,M,v,mesh)


eh1=0;
for i=1:2:mesh.ne
    eh1 =eh1 + local_norm_h1(M(i,:),v,u);
end
for i=2:2:mesh.ne
    
    eh1 =eh1 + local_norm_h1(M(i,:),v,u);
end
%

