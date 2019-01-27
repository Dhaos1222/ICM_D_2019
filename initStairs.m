function [louvre] = initStairs(louvre,stairs)

[row,col,z] = size(stairs);

for i = 1:row
    louvre(stairs(i,1),stairs(i,2),stairs(i,3)) = 2;
end

% louvre(200:300,200:300) = 0;