function [M, N,v,par,h,Igfree,Ig,free]=createmeshAS(nx,ny,intx,inty,Nx,Ny,I1,I2,ov)

% Create a triangulation of the [a1,b1]x[a2,b2].
% This triangulation is like 
%
% 11---12----13----14----15 
% |   / |   / |   / |   / |
% |  /  |  /  |  /  |  /  |
% | /   | /   | /   | /   |
% 6-----7-----8-----9----10 
% |   / |   / |   / |   / |
% |  /  |  /  |  /  |  /  |
% | /   | /   | /   | /   |
% 1-----2-----3-----4-----5
% nex vertical rectangles and ney horizontal rectangles.
% vertices 
%

nex=nx+ov+ov*(I1>1)*(I1<Nx);
ney=ny+ov+ov*(I2<Ny)*(I2>1);


ax= intx(1);    bx= intx(2);
ay= inty(1);    by= inty(2);

hx=(bx-ax)/nex;
hy=(by-ay)/ney;
 % h = waitbar(0,'Please wait...meshing');
nv=0; % nv==> number of vertices.
h.hx=hx;
h.hy=hy;

for iy=1:ney+1;
    for ix=1:nex+1;
%      waitbar((ix+(iy-1)*(nex+1))/(2+nex*ney),h)
    nv=nv+1;
    Ilocalx=(I1-1)*nx+1-(ov)*(I1>1)+(ix-1);
    Ilocaly=(I2-1)*ny-(ov)*(I2>1)+iy;
    ig=(Nx*nx+1)*(Ilocaly-1)+ Ilocalx;
    Ig(nv)=ig;
    v(nv,1)=ax+(ix-1)*(bx-ax)/nex; % x-coor. of the vertex
    v(nv,2)=ay+(iy-1)*(by-ay)/ney; % y-coor. of the vertex
    
    end
end
% close(h)

neup=0;eup=zeros(nex,1);

nedown=0;edown=zeros(nex,1);

neleft=0;eleft=zeros(ney,1);

neright=0;eright=zeros(ney,1);

ne=0; % ne==> nuber of elements
% h = waitbar(0,'Please wait...meshing');
for iy=1:ney;
    for ix=1:nex;
%   waitbar((ix+(iy-1)*nex)/(nex*ney),h)
    ne=ne+1;
    v1=ix  +(nex+1)*(iy-1); % 1 vertex of the triangle...
    v2=ix+1+(nex+1)*(iy-1); % 2 vertes of the triangle
    v3=ix+1+(nex+1)*(iy);   % 3 vertex of the triangle
    M(ne,:)=[v1 v2 v3];     % triangle odd
                            %       * 
                            %     / |
                            %    /  |
                            %   /   |
                            % * ----*

    if(iy==1) 
        nedown=nedown+1;
        edown(nedown)=ne;
    end
    if(ix==nex)
        neright=neright+1;
        eright(neright)=ne;
    end
    
    ne=ne+1;
    v1=ix  +(nex+1)*(iy-1);
    v2=ix+1+(nex+1)*(iy);
    v3=ix  +(nex+1)*(iy);
    M(ne,:)=[v1 v2 v3];     % triangle even
                            % *-----* 
                            % |   /
                            % |  / 
                            % | /  
                            % *


    if(iy==ney)
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
par.nex=nex;
par.ney=ney;
par.ne=ne;
par.nv=nv;
par.ax=ax;
par.bx=bx;
par.ay=ay;
par.by=by;
par.hx=hx;
par.hy=hy;
%par.nvel1=(2*par.nex+1)*(2*par.ney+1);


%list  of boundary vertices.
nvup=0;
vup=zeros(nex+1,1);
for iy=ney;
    for ix=1:nex;
    nvup=nvup+1;
    vup(nvup)=ix  +(nex+1)*(iy);
    vup(nvup+1)=ix+1+(nex+1)*(iy);
    end
end

nvdown=0;
vdown=zeros(nex+1,1);
for iy=1;
    for ix=1:nex;
    nvdown=nvdown+1;
    vdown(nvdown)=ix  +(nex+1)*(iy-1); % 1 vertex of the triangle...
    vdown(nvdown+1)=ix+1+(nex+1)*(iy-1); % 2 vertes of the triangle

    end
end


nvleft=0;
vleft=zeros(ney+1,1);
for iy=1:ney;
    for ix=1;
    nvleft=nvleft+1;
    vleft(nvleft)=ix  +(nex+1)*(iy-1);
    vleft(nvleft+1)=ix  +(nex+1)*(iy);
    end
end

nvright=0;
vright=zeros(ney+1,1);
for iy=1:ney;
    for ix=nex;
    nvright=nvright+1;
    %v1=ix  +(nex+1)*(iy-1); % 1 vertex of the triangle...
    vright(nvright)=ix+1+(nex+1)*(iy-1); % 2 vertes of the triangle
    vright(nvright+1)=ix+1+(nex+1)*(iy);   % 3 vertex of the triangle
    end
end

N.up=eup;
N.down=edown;
N.left=eleft;
N.right=eright;

N.vup=vup;
N.vdown=vdown;
N.vleft=vleft;
N.vright=vright;


d=unique([vup;vleft;vdown;vright]);
all=1:size(Ig,2);

free=setdiff(all,d);

Igfree=setdiff(Ig,Ig(d));



