function a=coefficient(x1,x2,k1)

%a=coeficientchannelball(x1,x2, mu);
%  a=coeficientball(x1,x2, mu);
%a=coeficientballWB(x1,x2, mu);
a=coeficientperm(x1,x2,k1);
%a=coeficientperm60(x1,x2,k1);
%a=coeficientrectangleball(x1,x2, mu);


%%%% function a=coeficient(x,y)
% a=x2*0+1;
%a=1-((x1-1/2).^2+(x2-1/2).^2);
%  a=exp((k1(ceil(x1*100), ceil(x2*100))));
% xx1=ceil(x1*80);
% xx2=ceil(x2*80);
% xx1=(xx1==0)+xx1;
% xx2=(xx2==0)+xx2;
%   a=k1(xx1,xx2 );
%  a=diag(a)';

 
 
 
 
% % % % % % n=30;m=2;
% % % % % %
% % % % % %  y1=(x1<1/5) + 1000*(x1>=1/5).*(x1<2/5)...
% % % % % %      + (x1>=2/5).*(x1<3/5)+1000*(x1>=3/5).*(x1<4/5)+(x1>=4/5);
% % % % % %  y1=y1+100*(1+sin(2*pi*n.*x1));
% % % % % %
% % % % % %  y2=(x2<1/5) + 1000*(x2>=1/5).*(x2<2/5)...
% % % % % %      + (x2>=2/5).*(x2<3/5)+1000*(x2>=3/5).*(x2<4/5)+(x2>=4/5);
% % % % % %  y2=y2+100*(1+sin(2*pi*n.*x2));
% % % % % %
% % % % % % a=y2.*y1;

%a=(1/2)*(x2<=.5)+ (1+1/2)*(x2>.5);
% % % % % B=10;
%    B=2;
%    a=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,1);
%    a=(a)+1;
%    ab=(mu*( (abs(x1-0.5).^2<0.5)+(( abs(x2-0.5))<0.05)));
%    a=a+ab;

% a=0*x1;
% B=8;
% for i1=1:B
%     for i2=1:B
%         I1=(x1>=((i1-1)/B)).*(x1<i1/B);
%         I2=(x2>=((i2-1)/B)).*(x2<i2/B);
%         if mod(i2-1,2)==0
% %        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,8);
%         aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,i1);
% %        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,4);
%         else
% %        aI=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,4);
%         aI=block2(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,i1);
%         end 
%         aI=aI .*I1.*I2;
% 
%         a=a+aI;
%     end
% end
%  a=(a)+1;
% 
% 
% %a=block(B*x1-floor(B*x1),B*x2-floor(B*x2),mu,);

function ab=block(x1,x2,mu,bn)
% bn=1;
if  bn==2 || bn==6
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
        ab=(mu*(( abs(x2-0.65))<.2));
%        ab=0*x1;
end


if  bn==3||bn==7
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.1)) <0.2) )));
%        ab=0*x1;
end


if  bn==1||bn==5
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.9)) <0.2) )));
%        ab=0*x1;
end

if bn==8
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.05) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.55)) <0.2) )));
%        ab=(mu*(( abs(x2-0.5))<0.1));
%        ab=0*x1;
end
% % % % if bn==3
% % % %     %     delta=0.1;
% % % %     %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
% % % %     %      ab=(mu*(((abs(x2-0.3))<0.2)));
% % % % %    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.02) )));
% % % % %        ab=(mu*(( abs(x2-0.5))<0.2));
% % % %         ab=(mu*(( abs(x2-0.65))<.15));
% % % % end
% % % % %
if bn==4
    %     delta=0.1;\
%          ab=x1*0;
%     ab=(mu*(( ( abs(x2-0.5).^2+abs(x1-0.5).^2 <0.1) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.55)) <0.2) )));
    %     ab=mu*( (max(abs(x1-0.4))<delta)+ ((abs(x1-0.6)+abs(x2-0.6))>delta) );
%        ab=0*x1;
end



function ab=block2(x1,x2,mu,bn)
% bn=1;
if bn==1 || bn==2 || bn==6 || bn==7
    %     delta=0.1;\
%          ab=x1*0;
%      ab1=(mu*(( ( (x2-0.3).^2+(x1-0.7).^2 <0.02) )));
%      ab2=(mu*(( ( (x2-0.7).^2+(x1-0.3).^2 <0.02) )));
%     ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.1) )));
%      ab=ab1+ab2;
    %     ab=mu*( (max(abs(x1-0.4))<delta)+ ((abs(x1-0.6)+abs(x2-0.6))>delta) );
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.55)) <0.2) )));
end

if  bn==4  
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
        ab=(mu*(( abs(x2-0.65))<.2));
end


if bn==3 
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.9)) <0.2) )));
end

if bn==5 
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.1)) <0.2) )));
end

if bn==8
    %     delta=0.1;
    %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
    %      ab=(mu*(((abs(x2-0.3))<0.2)));
%    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
     ab=(mu*(( (max(abs(x2-0.65),abs(x1-0.55)) <0.2) )));
end


%
% % % % if bn==3 || bn==7
% % % %     %     delta=0.1;
% % % %     %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
% % % %     %      ab=(mu*(((abs(x2-0.3))<0.2)));
% % % % %    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
% % % %         ab=(mu*(( abs(x2-0.5))<0.2));
% % % %         ab=0*x1;
% % % % end
% % % % 
% % % % if bn==4 ||bn==8
% % % %     %     delta=0.1;
% % % %     %     ab=(mu*((abs(x2-0.5)<0.3) -((abs(x2-0.5)<0.2).*((abs(x1-0.3)<.1)+(abs(x1-0.7)<.1)))));
% % % %     %      ab=(mu*(((abs(x2-0.3))<0.2)));
% % % % %    ab=(mu*(( ( (x2-0.5).^2+(x1-0.5).^2 <0.11) )));
% % % %         ab=(mu*(( abs(x2-0.5))<0.2));
% % % %         ab=0*x1;
% % % % end
% % % % 
