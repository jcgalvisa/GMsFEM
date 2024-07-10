for i1=1:Nx+1
    for i2=1:Ny+1
        M=dom_ov(i1,i2).M;
        v=dom_ov(i1,i2).v;
        col=dom_ov(i1,i2).Ig;
        Mass=dom_ov(i1,i2).Mass;
        psi=dom_ov(i1,i2).psibad(col,3);
        mc1=abs(dot(xf(col),Mass*psi));
%         trisurf(M,v(:,1),v(:,2),u(col),mod(i1+i2,2)+u(col)*0);
         trisurf(M,v(:,1),v(:,2), mc1+0*full(xf(col)));
%       trisurf(M,v(:,1),v(:,2),u(col),coeficient(v(:,1),v(:,2),mu,k1perm));
        hold on
    end
end

shading flat
axis square