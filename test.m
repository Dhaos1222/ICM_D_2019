floor = 5;
W = 480;
L = 533;
peopleNum = 0;
Louvre = zeros(W,L,floor);


for i = 1:floor
louvre = create_louvre(L,W,i);
Louvre(:,:,i) = louvre;
end

%exitList
load('exit.mat');
% [r,c] = size(exit);
% w = ones(r,1);
% exit = [exit w];
%  exit(:,end) = 4;

%stairsList
load('stairs.mat');

Louvre = initExit(Louvre,exit);
Louvre = initStairs(Louvre,stairs);
Louvre = initPeople(Louvre,peopleNum);

for i = 1:floor
h = show_plaza(Louvre(:,:,i),NaN,0.01);
end
