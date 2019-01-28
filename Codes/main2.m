% add extra exits
clear;

addNum = 3;

floorN = 5;
W = 480;
L = 533;
peopleNum = 500;
threshold = 0;
iterations = 25;
delta = 0.7;
time = 50000;
result = zeros(iterations+1,1);
Louvre = zeros(W,L,floorN);

secondCondition = 1;

showAnimation = 0;

for i = 1:floorN
louvre = create_louvre(L,W,i);
Louvre(:,:,i) = louvre;
end

%exitList
load('exit.mat');
% load('exitFirst.mat');
%stairsList
load('stairs.mat');
% load('stairsTest.mat');

if(secondCondition)
    for j = 1:addNum
[x,y,z] = getPoint(W,L,floorN);
while(Louvre(x,y,z)~= 0)
    [x,y,z] = getPoint(W,L,floorN);
end
Lovre(x,y,z) = 3;
exit=[exit;x,y,z];
    end
end

Louvre = initExit(Louvre,exit);
Louvre = initStairs(Louvre,stairs);
tempLouvre = Louvre;

[phes,phesAdd] = initPhes(Louvre);%initPheromones = 1
prob = initProb(phes,exit,stairs);
tempAdd = phesAdd;
[Louvre,peoples] = initPeople(Louvre,peopleNum);%peoples is the start of people location
%peoples save the start point of people

h = zeros(floorN,1);
if(showAnimation)
    for i = 1:floorN
        h(i) = show_plaza(Louvre(:,:,i),NaN,0.01);
    end
end
%peoplesT save peoples location in running program
peoplesT = peoples;
num = peopleNum;
it = 0;
tempSave = 9999*ones(peopleNum,1);
giveup = zeros(num,1);
for i = 1:time
%     peoplesTemp = peoplesT;    
    j = 1;

    while j <= num
x = peoplesT(j,1);
y = peoplesT(j,2);
z = peoplesT(j,3);
        [dx,dy,dz] = getMovePoint(prob,x,y,z);
        [Louvre,num,peoplesT,flag,peoples,it,phesAdd,tempSave,giveup] = move_action(x,y,z,dx,dy,dz,Louvre,num,peoplesT,j,peoples,it,phesAdd,tempSave,giveup);
        if flag == 0
            j = j+1;
        elseif flag == 2
            while(flag==2)
                if(giveup(j,1)>=10)
                    peoplesT(j,:) = [];
                    giveup(j,:) = [];
%                     x = peoplesT(j,1);
%                     y = peoplesT(j,2);
%                     z = peoplesT(j,3);
                    num = num - 1;
                    Louvre(x,y,z) = 0;
                    break;
                end
                [dx,dy,dz] = getMovePoint2(x,y,z);
                [Louvre,num,peoplesT,flag,peoples,it,phesAdd,tempSave,giveup] = move_action(x,y,z,dx,dy,dz,Louvre,num,peoplesT,j,peoples,it,phesAdd,tempSave,giveup);
                giveup(j,1) = giveup(j,1) + 1;
            end
            if flag ==0
                j = j+1;
            end
        end
    end
    
    if(showAnimation)
        for n = 1:floorN
            h(n) = show_plaza(Louvre(:,:,n),h(n),0.05);
        end
    end
    
    timeCost = i;
    if num <= threshold*peopleNum
        peoples(:,4)=tempSave;
        break;
    end
    str = strcat('cost time = ', num2str(timeCost));
    sprintf('%s',str)
    result(1,1) = timeCost;
end
peoples(:,4)=tempSave;

if(showAnimation)
    for i = 1:floorN
        h(i) = show_plaza(Louvre(:,:,i),h(i),0.01);
        xlabel(strcat('cost time = ', num2str(timeCost)));
    end
end

tempSave = 9999*ones(peopleNum,1);

it = 1;

%  h = show_plaza(Louvre(:,:,1),NaN,0.01);
for p = 1:iterations
    str = strcat('Now Iterations = ', num2str(p));
    sprintf('%s',str)
    % introduce people
    num = peopleNum;
    giveup = zeros(num,1);
    %new Louvre
    
    Louvre = tempLouvre;
    Louvre = resetPeople(Louvre,peoples);
    
    peoplesT = peoples;
    peoplesT(:,4) = 0;
    
    for i = 1:time
%     peoplesTemp = peoplesT;    
    j = 1;
    while j <= num
        x = peoplesT(j,1);
        y = peoplesT(j,2);
        z = peoplesT(j,3);
        [dx,dy,dz] = getMovePoint(prob,x,y,z);
        [Louvre,num,peoplesT,flag,peoples,it,phesAdd,tempSave,giveup] = move_action(x,y,z,dx,dy,dz,Louvre,num,peoplesT,j,peoples,it,phesAdd,tempSave,giveup);
        if flag == 0
            j = j+1;
        elseif flag == 2
            while(flag==2)
                if(giveup(j,1)>=10)
                    peoplesT(j,:) = [];
                    giveup(j,:) = [];
%                     x = peoplesT(j,1);
%                     y = peoplesT(j,2);
%                     z = peoplesT(j,3);
                    num = num - 1;
                    Louvre(x,y,z) = 0;
                    break;
                end
                [dx,dy,dz] = getMovePoint2(x,y,z);
                [Louvre,num,peoplesT,flag,peoples,it,phesAdd,tempSave,giveup] = move_action(x,y,z,dx,dy,dz,Louvre,num,peoplesT,j,peoples,it,phesAdd,tempSave,giveup);
                giveup(j,1) = giveup(j,1) + 1;
            end
            if flag ==0
                j = j+1;
            end
        end
    end
    
    if(showAnimation)
        for n = 1:floorN
            h(n) = show_plaza(Louvre(:,:,n),h(n),0.05);
        end
    end
%     if(p==iterations)
%         h = show_plaza(Louvre(:,:,1),h,0.05);
%     end
    %symbol of finished
    if num <= threshold*peopleNum
        peoples(:,4)=tempSave;
        break;
    end
    
    timeCost = i;
    str = strcat('cost time = ', num2str(timeCost),'  iteration ',num2str(p));
    sprintf('%s',str)
    result(p+1,1) = timeCost;
    end
    
    peoples(:,4)=tempSave;
    
    str = string('finished!');
    sprintf('%s',str)
    
    %updata phes&prob
    phes = delta*phes + phesAdd;
    temp = phesAdd;
    phesAdd = tempAdd;
    [eN,eNn] = size(exit);
    for n = 1:eN
        prob(exit(n,1),exit(n,2),exit(n,3)) = prob(exit(n,1),exit(n,2),exit(n,3))*100;
    end
    prob = initProb(phes,exit,stairs);
    
%     if(result(p,1)-result(p+1,1)<1e-4)
%         str = strcat('iterations = ', num2str(p));
%         sprintf('%s',str)
%         break;
%     end
end




