function [x,y,z] = getPoint(W,L,Z)
x = floor(W*rand())+1;
y = floor(L*rand())+1;
z = floor(Z*rand())+1;