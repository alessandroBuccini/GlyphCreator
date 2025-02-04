function G=createSpiral(n,spacing,rounds,siz,sigma,dim,depth,fileName)
t=linspace(0,rounds*2*pi,n)';
rho=linspace(0,siz,n)';
x=rho.*cos(t);
y=rho.*sin(t);
xext=(rho+spacing).*cos(t);
yext=(rho+spacing).*sin(t);
xx=[x(:);xext(end:-1:1);x(1)];
yy=[y(:);yext(end:-1:1);y(1)];
c=figure;
fill(xx,yy,'b')
axis equal
axis off
ax = gca;
exportgraphics(ax,fileName,'Resolution',300)
close(c)
I=(double(imread(fileName)));
I=(1-I(:,:,2)/255)*depth;
I=padarray(I,[3*dim,3*dim],0,'both');
P=fspecial('gaussian',[dim,dim],sigma);
G=conv2(P,I);
G=-G;