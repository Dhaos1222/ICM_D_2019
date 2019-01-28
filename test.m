clear;

floorN = 5;
W = 480;
L = 533;
peopleNum = 1;
Louvre = zeros(W,L,floorN);


for i = 1:floorN
louvre = create_louvre(L,W,i);
Louvre(:,:,i) = louvre;
end

%exitList
load('exit.mat');
% load('exitFirst.mat');
% [r,c] = size(exit);
% w = ones(r,1);
% exit = [exit w];
%  exit(:,end) = 4;
% exitF = exit(:,3);

%stairsList
load('stairs.mat');
% load('stairsTest.mat');

Louvre = initExit(Louvre,exit);
Louvre = initStairs(Louvre,stairs);

[phes,phesAdd] = initPhes(Louvre);%initPheromones = 1
prob = initProb(phes,exit,stairs);

[Louvre,peoples] = initPeople(Louvre,peopleNum);%peoples is the start of people location
%peoples save the start point of people

h = zeros(floorN,1);
for i = 1:floorN
h(i) = show_plaza(Louvre(:,:,i),NaN,0.01);
end

%peoplesT save peoples location in running program
peoplesT = peoples;
num = peopleNum;
it = 0;
for i = 1:1000

%     peoplesTemp = peoplesT;    
    j = 1;
    while j <= num
x = peoplesT(j,1);
y = peoplesT(j,2);
z = peoplesT(j,3);
        [dx,dy,dz] = getMovePoint(prob,x,y,z);
        [Louvre,num,peoplesT,flag,peoples,it,phesAdd] = move_action(x,y,z,dx,dy,dz,Louvre,num,peoplesT,j,peoples,it,phesAdd);
        if flag == 0
            j = j+1;
        end
    end

    for n = 1:floorN
        h(n) = show_plaza(Louvre(:,:,n),h(n),0.05);
    end
    timeCost = i;
    if num < peopleNum/10
        break;
    end
    str = strcat('cost time = ', num2str(timeCost));
    sprintf('%s',str)
end

for i = 1:floorN
    h(i) = show_plaza(Louvre(:,:,i),h(i),0.01);
    xlabel(strcat('cost time = ', num2str(timeCost)));
end

if(0)
iterations = 1;
it = 1;
for p = 1:iterations
    % introduce people
    num = peopleNum;
    %new Louvre
    Louvre = resetPeople(Louvre,peoples);
    peoplesT = peoples;
    peoplesT(:,4) = 0;
    
for i = 1:1000
%     peoplesTemp = peoplesT;    
    j = 1;
    while j <= num
x = peoplesT(j,1);
y = peoplesT(j,2);
z = peoplesT(j,3);
        [dx,dy,dz] = getMovePoint(prob,x,y,z);
        [Louvre,num,peoplesT,flag,peoples,it,phesAdd] = move_action(x,y,z,dx,dy,dz,Louvre,num,peoplesT,j,peoples,it,phesAdd);
        if flag == 0
            j = j+1;
        end
    end

    for n = 1:floorN
        h(n) = show_plaza(Louvre(:,:,n),h(n),0.05);
    end
    timeCost = i;
    if num < peopleNum/10
        break;
    end
    str = strcat('cost time = ', num2str(timeCost));
    sprintf('%s',str)
end
    
    
    str = string('finished!');
    sprintf('%s',str)

end

end



