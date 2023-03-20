function eh1=norm_velocity_L2(u,M,v,mesh,mu,k1perm)


eh1=0;
for i=1:mesh.ne
    eh1 =eh1 + local_norm_velocityL2(M(i,:),v,u,mu,k1perm);
end
% for i=2:2:mesh.ne
%     
%     eh1 =eh1 + local_norm_h1(M(i,:),v,u);
% end
%

