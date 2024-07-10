function plot_vector1D(u,dom,Nx)
% function plot_vector(u,dom,Nx,Ny)
color=0;
for i1=1:Nx
        color=color+1;
        M=dom(i1).M;
        v=dom(i1).v;
        col=dom(i1).Ig;
%        trisurf(M,v(:,1),v(:,2),u(col),mod(i1+i2,2)+u(col)*0);
         plot(v(:,1),u(col),'-k', 'LineWidth',3);
         hold on
         if mod(i1,2)==0
         plot(v(:,1),u(col)*0,'+b', 'LineWidth',2);
         else
         plot(v(:,1),u(col)*0,'+g', 'LineWidth',2);
         end
             
%         plot(v(:,1),u(col),'-k', 'LineWidth',2, 'LinColor',red);
%         plot(v(:,1),u(col),'-k', 'LineWidth',3,'Marker','+');
        hold on
    end


