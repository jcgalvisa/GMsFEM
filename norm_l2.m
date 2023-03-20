function el2=norm_l2(u,M,v,mesh)


el2=0;
 for i=1:2:mesh.ne
      el2 =el2 + local_norm_l2(M(i,:),v,u);
 end
 for i=2:2:mesh.ne
      el2 =el2 + local_norm_l2(M(i,:),v,u);
  end

%el2_I=sqrt(el2_I);

