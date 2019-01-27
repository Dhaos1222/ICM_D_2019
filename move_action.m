function [Louvre,peopleNum,peopleT] = move_action(x,y,z,dx,dy,dz,Louvre,peopleNum,peopleT,peopleRow)
if Louvre(dx,dy,dz)==1||Louvre(dx,dy,dz)==-1
    str = string('前面有人挡我');
    sprintf('%s',str)
%     myname = 920;
elseif Louvre(dx,dy,dz)==0
    Louvre(dx,dy,dz) = 1;
    Louvre(x,y,z) = 0;
    peopleT(peopleRow,:) = [dx,dy,dz];
elseif Louvre(dx,dy,dz)==2
%     if Louvre(x,y,z-1)==1
%         myname = 388;
%     else
        Louvre(x,y,z-1)=1;
        Louvre(x,y,z)=0;
        peopleT(peopleRow,:) = [dx,dy,dz];
%     end
elseif Louvre(dx,dy,dz)==3
    peopleNum = peopleNum - 1;
    Louvre(x,y,z) = 0;
    peopleT(peopleRow,:) = [];
end
            