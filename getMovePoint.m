function [dx,dy,dz] = getMovePoint(pros,x,y,z)
min = 9999999;
for i = -1:1
    for j = -1:1
        if pros(x+i,y+j,z)<min
            min = pros(x+i,y+j,z);
            dx = x+i;
            dy = y+j;
            dz = z;
        elseif pros(x+i,y+j,z)==min
            if(rand()>0.5)
                dx = x+i;
                dy = y+j;
                dz = z;
            end
        end
    end
end
        
        