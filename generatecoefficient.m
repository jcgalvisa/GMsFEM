rand('twister',50482)
coefficient_values=ones(100,100);
R=7;
for i=1:10
   coefficient_values( 10*(i-1)+(3:7),:)=highcontrast;
end

coefficient_values(1:10,:)=1;
coefficient_values(91:100,:)=1;
coefficient_values(:,1:10)=1;
coefficient_values(:,91:100)=1; 