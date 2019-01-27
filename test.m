floorN = 1;
W = 480;
L = 533;
peopleNum = 10;
Louvre = zeros(W,L,floorN);


for i = 1:floorN
louvre = create_louvre(L,W,i);
Louvre(:,:,i) = louvre;
end

%exitList
load('exitFirst.mat');
% [r,c] = size(exit);
% w = ones(r,1);
% exit = [exit w];
%  exit(:,end) = 4;
% exitF = exit(:,3);

%stairsList
load('stairsTest.mat');

Louvre = initExit(Louvre,exit);
Louvre = initStairs(Louvre,stairs);

[phes,phesAdd] = initPhes(Louvre);%initPheromones = 1
prob = initProb(phes,exit,stairs);

[Louvre,peoples] = initPeople(Louvre,peopleNum);%peoples is the start of people location
%peoples save the start point of people


for i = 1:floorN
h = show_plaza(Louvre(:,:,i),NaN,0.01);
end

%peoplesT save peoples location in running program
peoplesT = peoples;

for i = 1:1500
    num = peopleNum;
    peoplesTemp = peoplesT;
    for j = 1:num
        [x,y,z,peoplesTemp,peopleRow] = getPeople(peoplesTemp);
        [dx,dy,dz] = getMovePoint(prob,x,y,z);
        [Louvre,peopleNum,peoplesT] = move_action(x,y,z,dx,dy,dz,Louvre,peopleNum,peoplesT,peopleRow);
    end
    if peopleNum == 0
        break;
    end

    h = show_plaza(Louvre(:,:,1),h,0.5);
    
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
            
            
    for i = 1:floorN
        h = show_plaza(Louvre(:,:,i),h,0.02);
    end
    

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






