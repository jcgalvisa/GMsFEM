function [Element_list, Boundary,vertex_list,mesh_parameter,h,boundary_nodes,free]=square_mesh(nx,ny,Nx,Ny,intx,inty)

% Create a triangulation of the [a1,b1]x[a2,b2].
% This triangulation is like
%
% 11---12----13----14----15
% |     |     |     |     |
% |     |     |     |     |
% |     |     |     |     |
% 6-----7-----8-----9----10
% |     |     |     |     |
% |     |     |     |     |
% |     |     |     |     |
% 1-----2-----3-----4-----5
% nex vertical rectangles and ney horizontal rectangles.
% vertices
%

ne_x=Nx*nx; % the x2 is because is has 2x2 coarse element.
ne_y=Ny*ny;
number_of_vertex=(ne_x+1)*(ne_y+1);

ax= intx(1);    bx= intx(2);
ay= inty(1);    by= inty(2);

hx=(bx-ax)/ne_x;
hy=(by-ay)/ne_y;
% h = waitbar(0,'Please wait...meshing');
nv=0; % nv==> number of vertices.
h.hx=hx;
h.hy=hy;

vertex_list=sparse(2,number_of_vertex);
for iy=1:ne_y+1
    for ix=1:ne_x+1
        nv=nv+1;
        vertex_list(nv,1)=ax+(ix-1)*(bx-ax)/ne_x; % x-coor. of the vertex
        vertex_list(nv,2)=ay+(iy-1)*(by-ay)/ne_y; % y-coor. of the vertex

    end
end

neup=0;eup=zeros(ne_x,1);

nedown=0;edown=zeros(ne_x,1);

neleft=0;eleft=zeros(ne_y,1);

neright=0;eright=zeros(ne_y,1);

ne=0; % ne==> nuber of elements
% h = waitbar(0,'Please wait...meshing');
Element_list=zeros(ne_x*ne_y,4);
for iy=1:ne_y
    for ix=1:ne_x
        %   waitbar((ix+(iy-1)*nex)/(nex*ney),h)
        ne=ne+1;
        v1=ix  +(ne_x+1)*(iy-1); % 1 vertex of the rectangle...
        v2=ix+1+(ne_x+1)*(iy-1); % 2 vertes of the rectangle
        v3=ix+1+(ne_x+1)*(iy);   % 3 vertex of the rectangle
        v4=ix  +(ne_x+1)*(iy);   % 4 vertex of the rectangle
        Element_list(ne,:)=[v1 v2 v3 v4];     %
        % *---- *
        % |     |
        % |     |
        % |     |
        % * ----*

        if(iy==1)
            nedown=nedown+1;
            edown(nedown)=ne;
        end
        if(ix==ne_x)
            neright=neright+1;
            eright(neright)=ne;
        end



        if(iy==ne_y)
            neup=neup+1;
            eup(neup)=ne;
        end

        if(ix==1)
            neleft=neleft+1;
            eleft(neleft)=ne;
        end


    end
end
% close(h)
mesh_parameter.nex=ne_x;
mesh_parameter.ney=ne_y;
mesh_parameter.ne=ne;
mesh_parameter.nv=nv;
mesh_parameter.ax=ax;
mesh_parameter.bx=bx;
mesh_parameter.ay=ay;
mesh_parameter.by=by;
mesh_parameter.hx=hx;
mesh_parameter.hy=hy;
%par.nvel1=(2*par.nex+1)*(2*par.ney+1);


%list  of boundary vertices.
nvup=0;
vup=zeros(ne_x+1,1);
for iy=ne_y
    for ix=1:ne_x
        nvup=nvup+1;
        vup(nvup)=ix  +(ne_x+1)*(iy);
        vup(nvup+1)=ix+1+(ne_x+1)*(iy);
    end
end

nvdown=0;
vdown=zeros(ne_x+1,1);
for iy=1
    for ix=1:ne_x
        nvdown=nvdown+1;
        vdown(nvdown)=ix  +(ne_x+1)*(iy-1); % 1 vertex of the triangle...
        vdown(nvdown+1)=ix+1+(ne_x+1)*(iy-1); % 2 vertes of the triangle

    end
end


nvleft=0;
vleft=zeros(ne_y+1,1);
for iy=1:ne_y
    for ix=1
        nvleft=nvleft+1;
        vleft(nvleft)=ix  +(ne_x+1)*(iy-1);
        vleft(nvleft+1)=ix  +(ne_x+1)*(iy);
    end
end

nvright=0;
vright=zeros(ne_y+1,1);
for iy=1:ne_y
    for ix=ne_x
        nvright=nvright+1;
        %v1=ix  +(nex+1)*(iy-1); % 1 vertex of the triangle...
        vright(nvright)=ix+1+(ne_x+1)*(iy-1); % 2 vertes of the triangle
        vright(nvright+1)=ix+1+(ne_x+1)*(iy);   % 3 vertex of the triangle
    end
end

Boundary.up=eup;
Boundary.down=edown;
Boundary.left=eleft;
Boundary.right=eright;

Boundary.vup=vup;
Boundary.vdown=vdown;
Boundary.vleft=vleft;
Boundary.vright=vright;


boundary_nodes=unique([vup;vleft;vdown;vright]);
all=1:number_of_vertex;

free=setdiff(all,boundary_nodes);



