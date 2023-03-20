function [gradx,grady,Mpx,Mpy,Mpz]=grad_comp(u,M,v,mesh)


eh1=0;
for i=1:2:mesh.ne
    [vx,vy,mpx,mpy,mpz]=local_grad(M(i,:),v,u);
    gradx(i)=vx;
    grady(i)=vy;
    Mpx(i)=mpx;
    Mpy(i)=mpy;
    Mpz(i)=mpz;
end
for i=2:2:mesh.ne
     [vx,vy,mpx,mpy,mpz]=local_grad(M(i,:),v,u);
    gradx(i)=vx;
    grady(i)=vy;
    Mpx(i)=mpx;
    Mpy(i)=mpy;
        Mpz(i)=mpz;

end
%

