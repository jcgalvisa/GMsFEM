


rand('twister',50482)
kaux=ones(100,100);
R=7;
for i=1:2:10
         r1=rand;
          kaux(2+(i-1)*10:5+(i-1)*10,1:10)=highcontrast*(1+R*r1);
          kaux(3+(i-1)*10:7+(i-1)*10,11:20)=highcontrast*(1+R*r1);
           kaux(5+(i-1)*10:8+(i-1)*10,21:30)=highcontrast*(1+R*r1);


           r1=rand;
          kaux(2+(i-1)*10:5+(i-1)*10,41:50)=highcontrast*(1+R*r1);
          kaux(3+(i-1)*10:7+(i-1)*10,51:60)=highcontrast*(1+R*r1);
           kaux(5+(i-1)*10:8+(i-1)*10,61:70)=highcontrast*(1+R*r1);

           r1=rand;
           kaux(2+(i-1)*10:5+(i-1)*10,81:90)=highcontrast*(1+R*r1);
          kaux(4+(i-1)*10:7+(i-1)*10,91:100)=highcontrast*(1+R*r1);

end



for i=2:2:10
    r1=rand;
    for j=1:10

kaux(4+(i-1)*10:6+(i-1)*10,4+(j-1)*10:6+(j-1)*10)=highcontrast*(1+R*r1);

    end

    kaux((i-1)*10+2:(i-1)*10+5,21:30)=highcontrast*(1+R*r1);
  kaux((i-1)*10+3:(i-1)*10+6,31:40)=highcontrast*(1+R*r1);
   kaux((i-1)*10+4:(i-1)*10+7,41:50)=highcontrast*(1+R*r1);
end



kaux(40:60,:)=1;

x=linspace(0,1,100);
y=linspace(0,1,100);
f=inline('(0*sin(2*pi*x)+1.1*sqrt(x))*0.05+0.4');
g=inline('(0*sin(2*pi*x)+1.1*sqrt(x))*0.05+0.42');



r1=rand;
for i=1:100
    for j=1:100
        if x(j)>=f(y(i)) && x(j)<=g(y(i))
            kaux(j,i)=highcontrast*(1+R*r1);
        end
    end
end


kaux(1:10,:)=1;
kaux(91:100,:)=1;
kaux(:,1:10)=1;
kaux(:,91:100)=1;
coefficient_values=kaux;