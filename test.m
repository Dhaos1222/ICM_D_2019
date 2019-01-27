clear;

floorN = 5;
W = 480;
L = 533;
peopleNum = 200;
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

for i = 1:100
    num = peopleNum;
    peoplesTemp = peoplesT;
    for j = 1:num
x = peoplesTemp(j,1);
y = peoplesTemp(j,2);
z = peoplesTemp(j,3);
        [dx,dy,dz] = getMovePoint(prob,x,y,z);
        [Louvre,peopleNum,peoplesT] = move_action(x,y,z,dx,dy,dz,Louvre,peopleNum,peoplesT,j);
    end

    for n = 1:floorN
        h(n) = show_plaza(Louvre(:,:,n),h(n),0.05);
    end
    timeCost = i;
    if peopleNum == 0
        break;
    end
    
end

for i = 1:floorN
    h(i) = show_plaza(Louvre(:,:,i),h(i),0.01);
    xlabel(strcat('cost time = ', num2str(timeCost)));
end

    
            



iterations = 1;
for n = 1:iterations
    % introduce people
    num = peopleNum;
    
    %new Louvre
    
    % BUG!
%     if n>1
% %     for i = 1:floorN
% %     louvre = create_louvre(L,W,i);
% %     Louvre(:,:,i) = louvre;
%     for i = 1:peopleNum
%         Louvre(peoples(i,1),peoples(i,2),peoples(i,3)) = 0;
%     end
%     end

%     Louvre = initExit(Louvre,exit);
%     Louvre = initStairs(Louvre,stairs);
%     Louvre = initPeople(Louvre,num);
    
%     for i = 1:1000
%         temp = peoples;
%         j = 0;
%         while j<num
%             [x,y,z,temp] = getPeople(temp);
%             
            %judge
            
            %
            
            
%     for i = 1:floorN
%         h = show_plaza(Louvre(:,:,i),h,0.02);
%     end
    

%     % update rules for lanes
%     [plaza, v, time] = switch_lanes(plaza, v, time); % lane changes
%     [plaza, v, time] = move_forward(plaza, v, time, vmax); % move cars forward
%     [plaza, v, time, departurescount, departurestime] = clear_boundary(plaza, v, time);
%     
%     % flux calculations
%     influx(i) = arrivalscount;
%     outflux(i) = departurescount;
%     timecost = [timecost, departurestime];
end






