function neigh=linearones(neigh,Nx,Ny,b,vertex_list)

for i1=1:Nx+1
    for i2=1:Ny+1
        xlin=b*0; 
        c=neigh(i1,i2).c;
        diamx=neigh(i1,i2).diam.x;
        diamy=neigh(i1,i2).diam.y;
        Ig=neigh(i1,i2).nodes;
        vx=vertex_list(Ig,1);
        vy=vertex_list(Ig,2);
        xlin(Ig)=phiI(c,diamx,diamy,vx,vy);
        neigh(i1,i2).philin=xlin;
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
