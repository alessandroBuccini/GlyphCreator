function G=createGlyph(options)
% load background
switch options.globalOpt.background
    case 'Option 1'
        load('background.mat','D1')
        D=D1;
    case 'Option 2'
        load('background.mat','D2')
        D=D2;
end
% resize background
D=imresize(D,[options.globalOpt.dimensions(2),options.globalOpt.dimensions(1)]);
% create spiral
s=createSpiral(options.spiralOpt);
% blur spiral
sigma=options.globalOpt.blurStd;
P=fspecial('gaussian',[5*sigma+1,5*sigma+1],sigma);
s=conv2(s,P,'same');
% resize spiral
ratioS=min(size(D))/max(size(s));
s=imresize(s,options.spiralOpt.relativeSize*ratioS);
s=padarray(s,size(D)-size(s),0,'post');
% move spiral
s=circshift(s,[options.spiralOpt.relativePosition(2),options.spiralOpt.relativePosition(1)]);
% create line
l=createLine(options.lineOpt);
% blur line
l=conv2(l,P,'same');
% resize spiral
ratioL=min(size(D))/max(size(l));
l=imresize(l,options.lineOpt.relativeSize*ratioL);
l=padarray(l,size(D)-size(l),0,'post');
% move line
l=circshift(l,[options.lineOpt.relativePosition(2),options.lineOpt.relativePosition(1)]);
% Create final surface
G=D+options.spiral*s+options.line*l;
end

function S=createSpiral(opt)
fileName='auxSpiral.png';
n=1000; % Resolution for construction
t=linspace(0,opt.rounds*2*pi,n)';
rho=linspace(0,opt.totalWidth,n)';
x=rho.*cos(t);
y=rho.*sin(t);
xext=(rho+opt.width).*cos(t);
yext=(rho+opt.width).*sin(t);
xx=[x(:);xext(end:-1:1);x(1)];
yy=[y(:);yext(end:-1:1);y(1)];
c=figure;
fill(xx,yy,'b')
axis equal
axis off
ax = gca;
exportgraphics(ax,fileName,'Resolution',300)
close(c)
S=(double(imread(fileName)));
S=(1-S(:,:,2)/255)*opt.depth;
S=-S;
end

function L=createLine(opt)
fileName='auxLine.png';
x=linspace(0,opt.length,2*opt.peaks+1);
x=x(:);
y=0*x;
y(2:2:end)=opt.height;
ys=y+opt.width;
xx=[x(:);x(end:-1:1);x(1)];
yy=[y(:);ys(end:-1:1);y(1)];
c=figure;
fill(xx,yy,'b')
axis equal
axis off
ax = gca;
exportgraphics(ax,fileName,'Resolution',300)
close(c)
L=(double(imread(fileName)));
L=(1-L(:,:,2)/255)*opt.depth;
L=-L;
end