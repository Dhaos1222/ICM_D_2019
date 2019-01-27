function louvre = initExit(louvre,exit)
[row,col,z] = size(exit);


for i = 1:row
    louvre(exit(i,1),exit(i,2),exit(i,3)) = 3;
end

% louvre(200:300,200:300) = 0;