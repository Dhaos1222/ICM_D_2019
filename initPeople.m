function [louvre] = initPeople(louvre, num)
[W,L,Z] = size(louvre);
for i = 1:num
    [x,y,z] = getPoint(W,L,Z);
    while louvre(x,y,z)~=0
        [x,y,z] = getPoint(W,L,Z);
    end
    louvre(x,y,z) = 1;
end
