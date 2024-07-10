function a=coeficientperm(x1,x2,k1)

xx1=ceil(x1*100);
xx2=ceil(x2*100);
xx1=min(max(1,xx1),100);
xx2=min(max(1,xx2),100);
  a=k1(xx1,xx2 );
 a=diag(a)';
