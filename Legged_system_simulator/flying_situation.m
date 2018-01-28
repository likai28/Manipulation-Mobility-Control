function dxy= flying_situation(t,xy)

 g=9.8;
 dxy=zeros(4,1);
 dxy(1)=xy(3);
 dxy(2)=xy(4);
 dxy(3)=0;
 dxy(4)= -g; 
end