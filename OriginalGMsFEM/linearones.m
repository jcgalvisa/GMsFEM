function dom_ov=linearones(dom,dom_ov,Nx,Ny,b)

for i1=1:Nx+1
    for i2=1:Ny+1
       xlin=b*0; 
        c=dom_ov(i1,i2).c;
        diamx=dom_ov(i1,i2).diam.x;
        diamy=dom_ov(i1,i2).diam.y;
        Ig=dom_ov(i1,i2).Ig;
        v=dom_ov(i1,i2).v;
        vx=v(:,1);
        vy=v(:,2);
        xlin(Ig)=phiI(c,diamx,diamy,vx,vy);
        dom_ov(i1,i2).philin=xlin;
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
