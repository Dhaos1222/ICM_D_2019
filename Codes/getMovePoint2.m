function [x,y,dz] = getMovePoint2(dx,dy,dz)
m = floor(3*rand())-1;
n = floor(3*rand())-1;
while(m~=0&&n~=0)
    m = floor(3*rand())-1;
    n = floor(3*rand())-1;
end
x = dx+m;
y = dy+n;