function G=createZigZag(L,spacing,nVert,height,sigma,dim,depth,fileName)

x=linspace(0,L,2*nVert+1);
x=x(:);
y=0*x;
y(2:2:end)=height;
ys=y+spacing;
xx=[x(:);x(end:-1:1);x(1)];
yy=[y(:);ys(end:-1:1);y(1)];
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