function [Louvre,peopleNum,peopleT,flag,people,it,phesAdd,tempSave,giveup] = move_action(x,y,z,dx,dy,dz,Louvre,peopleNum,peopleT,peopleRow,people,it,phesAdd,tempSave,giveup)
flag = 0;
if dx==x&&dy==y&&dz==z
    flag = 2;
elseif Louvre(dx,dy,dz)==1
%     str = string('wait');
%     sprintf('%s',str)
    flag = 0;
%     myname = 920;
elseif Louvre(dx,dy,dz)==-1
    flag = 2;
elseif Louvre(dx,dy,dz)==0
    Louvre(dx,dy,dz) = 1;
    Louvre(x,y,z) = 0;
    if(it==1)
%             if(people(peopleRow,4)<1)
%                 people(peopleRow,4) = 0.05;
%             end
            if people(peopleRow,4)~=9999
                phesAdd(dx,dy,dz) = phesAdd(dx,dy,dz)+1/people(peopleRow,4);
            end
    end
    peopleT(peopleRow,1:3) = [dx,dy,dz];
    peopleT(peopleRow,4) = peopleT(peopleRow,4)+1;
    flag = 0;
elseif Louvre(dx,dy,dz)==2
%     if Louvre(x,y,z-1)==1
%         myname = 388;
%     else
        Louvre(x,y,z-1)=1;
        Louvre(x,y,z)=0;
        if(it==1)
%             if(people(peopleRow,4)<1)
%                 people(peopleRow,4) = 0.05;
%             end
            if people(peopleRow,4)~=9999
                phesAdd(dx,dy,dz) = phesAdd(dx,dy,dz)+1/people(peopleRow,4);
            end
        end
        peopleT(peopleRow,1:3) = [x,y,z-1];
        peopleT(peopleRow,4) = peopleT(peopleRow,4)+1;
        flag = 0;
%     end
elseif Louvre(dx,dy,dz)==3
    peopleNum = peopleNum - 1;
    Louvre(x,y,z) = 0;
    if(it==1)
%             if(people(peopleRow,4)<1)
%                 people(peopleRow,4) = 0.05;
%             end        
            if people(peopleRow,4)~=9999
                phesAdd(dx,dy,dz) = phesAdd(dx,dy,dz)+1/people(peopleRow,4);
            end
    end
    flag = 1;
    tempSave(peopleRow) = peopleT(peopleRow,4);
    peopleT(peopleRow,:) = [];
    giveup(peopleRow,:) = [];
end
            