function dxy= stance_situation(t,xy)
  m=80;
  k=20000;
  l0=1;
  g=9.8;
  alpha = pi*68/180;
 dxy=zeros(4,1);
 dxy(1)=xy(3);
 dxy(2)=xy(4);
 dxy(3)=k/m*(l0/sqrt(xy(1)^2+xy(2)^2)-1)*xy(1);
 dxy(4)=k/m*(l0/sqrt(xy(1)^2+xy(2)^2)-1)*xy(2)-g;
end

