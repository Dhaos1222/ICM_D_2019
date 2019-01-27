function [x,y,z,peoples,peopleRow] = getPeople(peoples)
[W,L] = size(peoples);
n = floor(W*rand())+1;
x = peoples(n,1);
y = peoples(n,2);
z = peoples(n,3);
peopleRow = n;
peoples(n,:) = [];