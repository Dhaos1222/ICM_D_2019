function prob = initProb(phes,exit,stairs)
prob = phes;
d = 1;%distance of neighbour
apha = 1;
beta = 1;

% [i,j,z] = ind2sub(size(prob),find(prob==1));
% I = [i j z];
% [W,L] = size(I);
[W,L,D] = size(prob);
for z = 1:D
    for y = 10:L-10
        for x = 10:W-10
            yita = getYita(d,x,y,z,exit,stairs);
            neighbour = 0;
            for j = -1:1
                for k = -1:1
                    temp = getYita(d,x+j,y+k,z,exit,stairs);
                    neighbour = neighbour + (phes(x+j,y+k,z))^apha*temp^beta;
                end
            end
            neighbour = neighbour - (phes(x,y,z)^apha*yita^beta);
            prob(x,y,z) = 100*((phes(x,y,z)^apha*yita^beta)/neighbour);
            if yita == 2
                prob(x,y,z) = prob(x,y,z)/100;
            end
        end
    end
end

% for i = 1:W
% %     dmin = minDist2Exit(I(i,1),I(i,2),I(i,3),exit,stairs);
% %     yita = 1/d * 1/dmin;
%     yita = getYita(1,I(i,1),I(i,2),I(i,3),exit,stairs);
%     neighbour = 0
%     for j = -1:1
%         for k = -1:1
%             temp = getYita(1,I(i,1)+j,I(i,2)+k,I(i,3),exit,stairs);
%             neighbour = neighbour + (phes(I(i,1)+j,I(i,2)+k,I(i,3))^apha*temp^beta);
%         end
%     end
%     neighbour = neighbour - (phes(I(i,1),I(i,2),I(i,3))^apha*yita^beta);
%     prob(I(i,1),I(i,2),I(i,3)) = (phes(I(i,1),I(i,2),I(i,3))^apha*yita^beta)/neighbour;
% end

% found = find(prob==1);
% for k = found'
%     prob(k) = 233;
% end

function yita = getYita(d,x,y,z,exit,stairs)
dmin = minDist2Exit(x,y,z,exit,stairs);
if dmin == 0
    yita = 2;
else
    yita = 1/d * 1/dmin;
end