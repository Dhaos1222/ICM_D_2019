a = 0;
for i = 1:7700
    [x,y,z] = getPoint(20,20,1);
    while x~=5
        [x,y,z] = getPoint(20,20,1);
        a = a+1;
    end
end