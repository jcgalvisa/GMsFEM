function plot_meshnew2(dom,Nx,Ny)
% function plot_mesh(dom,dom_aux,Nx,Ny)

% 
% for i=1:Nx
%     for j=1:Ny
% 
%     plot_local_mesh(dom(i,j).M,dom(i,j).v,i+j);
%     hold on
%     end
% end
e=0;
for i=1:Nx
    for j=1:Ny
        M=dom(i,j).M;
        v=dom(i,j).v;
        if(mod((i+j),2)==0) 
            trisurf(M,v(:,1)+(i-1)*e,v(:,2)+(j-1)*e,v(:,2)*0-10);
        else
            trisurf(M,v(:,1)+(i-1)*e,v(:,2)+(j-1)*e,v(:,2)*0-20);
        end
    hold on
    end
end
% 
% s=0.01;
% for i=1:Nx
%     M=dom_up(i).M(dom_up(i).B.down,:);
%     v=dom_up(i).v;
%     if mod(i,2)==1
%         triplot(M,v(:,1),v(:,2)+s,'r-','LineWidt',0.5);
%     else
%         triplot(M,v(:,1),v(:,2)+s,'b','LineWidt',0.5);
%     end
%     M=dom_down(i).M(dom_down(i).B.up,:);
%     v=dom_down(i).v;
%     if mod(i,2)==1
%         triplot(M,v(:,1),v(:,2)-s,'red','LineWidt',0.5);
%     else
%         triplot(M,v(:,1),v(:,2)-s,'blue','LineWidt',0.5);
%     end
%     hold on
% end
% 
% for j=1:Ny
%     M=dom_left(j).M(dom_left(j).B.right,:);
%     v=dom_left(j).v;
%     if mod(j,2)==1
%         triplot(M,v(:,1)-s,v(:,2),'r-','LineWidt',0.5);
%     else
%         triplot(M,v(:,1)-s,v(:,2),'b-','LineWidt',0.5);
%     end
%     M=dom_right(j).M(dom_right(j).B.left,:);
%     v=dom_right(j).v;
%     if mod(j,2)==1
%         triplot(M,v(:,1)+s,v(:,2),'r-','LineWidt',0.5);
%     else
%         triplot(M,v(:,1)+s,v(:,2),'b-','LineWidt',0.5);
%     end
%     hold on
% end
axis square