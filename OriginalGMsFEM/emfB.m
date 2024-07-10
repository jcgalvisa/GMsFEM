function [dom_ov,iter]=emfB(dom,dom_ov,Nx,Ny,b,mu,k1perm)


max_it=5000;
tol=1e-10;

vones=createone(b,dom,Nx,Ny);
% plot_vector(vones, dom,Nx,Ny,mu,k1perm);
% pause

%xaux = Padcg2(b*0, vones,b, max_it, tol,dom,dom_ov,Nx,Ny);
[xaux, error, iter, flag, lambdamax, condnumber] = Padcg2(b*0, vones*0+1,b, max_it, tol,dom,dom_ov,Nx,Ny);

for i1=1:Nx+1
    for i2=1:Ny+1
        dom_ov(i1,i2).phiEM=applay_AI_invB(xaux,dom_ov,i1,i2,Nx,Ny);
%        plot_vector(xlin,dom,Nx,Ny);
%        pause 
%        hold off
        
    end
end
