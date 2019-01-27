function louvre = create_louvre(L, W, floor)
step = 1;
border = 20;
L = L/step;
W = W/step;

pw = round(W/3);
pl = round(L/3);

louvre = 30*ones(W,L);
%shape
%RICHELIEU
louvre(border:round(pw/2)+border/2,border:round((L-pl-border)/2)) = -1;
louvre(border:pw+border/4,round((L-pl-border)/2):L-pl-border) = -1;
%DENON
louvre(W-border:-1:W-round(pw/2)-border/2,border:round((L-pl-border)/2)) = -1;
louvre(W-border:-1:W-pw-border/4,round((L-pl-border)/2):L-pl-border) = -1;
%SULLYte
louvre(pw-border:2*pw+border,2*pl:3*pl-border) = -1;
louvre(pw-border:pw+border/4,L-pl-border:2*pl) = -1;
louvre(2*pw-border/4:2*pw+border,L-pl-border:2*pl) = -1;

%road
if floor~=1
%RICHELIEU
louvre(border+border:round(pw/2)-border/2,border+border:L-pl-border-border) = 0;
louvre(round(pw/2)-border/2:pw-border/2,round((L-pl-border)/2)+border/2:L-pl-border-border) = 0;
if floor~=5
%DENO
louvre(W-border-border:-1:W-pw+border/4,round((L-pl-border)/2)+border/2:L-pl-border-border) = 0;
louvre(W-border-border:-1:W-round(pw/2)+border/2,border+border:L-pl-border-border) = 0;
end
%SULLYTE
louvre(pw-border+border/4:2*pw+border/4,2*pl+border:3*pl-border-border) = 0;
%ROUTE
louvre(pw-3*border/4:pw-border/4,round((L-pl-border)/2)+border/2:3*pl-2*border) = 0;
if floor~=5
louvre(2*pw+1*border/4:2*pw+3*border/4,round((L-pl-border)/2)+border/2:3*pl-2*border) = 0;
end
end
if floor == 1||floor == 2
    if floor == 1
    louvre(pw+2*border:2*pw-2*border,round(pl/2)-2*border:round(pl/2)+pw-4*border-2*border) = -1;
    louvre(pw+2*border+border/2:2*pw-2*border-border/2,round(pl/2)+border/2-2*border:round(pl/2)+pw-4*border-border/2-2*border) = 0;
    louvre(pw+2*border+border:2*pw-2*border-border,round(pl/2)+pw-4*border-2*border:round(pl/2)+pw-2*border-2*border) = -1;
    end
    louvre(pw+border:2*pw-border,round(pl/2)+pw-3*border-2*border:round(pl/2)+pw+3*border-2*border) = -1;%SecondSquareShape
    if floor == 1
    louvre(pw+2*border+border+border/2:2*pw-2*border-border-border/2,round(pl/2)+pw-4*border-border/2-2*border:round(pl/2)+pw-3*border-2*border+border/2) = 0;
    end
    louvre(pw+border+border/2:2*pw-border-border/2,round(pl/2)+pw-3*border-2*border+border/2:round(pl/2)+pw+3*border-2*border-border/2) = 0;%SecondSquareRoute
    louvre(pw+2*border+border:2*pw-2*border-border,round(pl/2)+pw+3*border-2*border:round(pl/2)+pw+3*border-2*border+border) = -1;
    louvre(pw+2*border:2*pw-2*border,round(pl/2)+pw+3*border-2*border+border:round(pl/2)+pw+3*border-2*border+border+2*border) = -1;
    louvre(pw+2*border+border+border/2:2*pw-2*border-border-border/2,round(pl/2)+pw+3*border-2*border-border/2:round(pl/2)+pw+3*border-2*border-border/2+2*border) = 0;
    louvre(pw+border+3*border/2:2*pw-border-3*border/2,round(pl/2)+pw+3*border-2*border+border+border/2:round(pl/2)+pw+3*border-2*border+border+2*border-border/2) = 0;    
    
    %rightRoute
    louvre(pw+2*border+border:2*pw-2*border-border,round(pl/2)+pw+3*border-2*border+border+2*border:round(pl/2)+pw+3*border-2*border+border+2*border+3*border/2) = -1;
    louvre(pw+2*border+border+border/2:2*pw-2*border-border-border/2,round(pl/2)+pw+3*border-2*border+border+2*border-border/2:2*pl+border) = 0;
    %up&downRoute
    louvre(pw+border/4:pw+border,round(pl/2)+pw-3*border-2*border+3*border/2:round(pl/2)+pw-3*border-2*border+3*border+3*border/2) = -1;
    louvre(pw-border/2:pw+border+border/2,round(pl/2)+pw-3*border-2*border+2*border:round(pl/2)+pw-3*border-2*border+3*border+border) = 0;
    
    louvre(2*pw-border:W-pw-border/4,round(pl/2)+pw-3*border-2*border+3*border/2:round(pl/2)+pw-3*border-2*border+3*border+3*border/2) = -1;
    louvre(2*pw-border-border/2:W-pw+border/4,round(pl/2)+pw-3*border-2*border+2*border:round(pl/2)+pw-3*border-2*border+3*border+border) = 0;    
end


%wall
%SULLYTE
louvre(pw-border+5*border/4:2*pw-border/4,2*pl+border+border:3*pl-border-border-border)= -1;
%RICHELIEU
mid = round((L-pl-border)/2);
if floor==1||floor==4||floor==5
louvre(round(pw/2)-border/2:pw-3*border/2,mid+3*border/2:L-pl-border-border-mid/2) = -1;
louvre(round(pw/2)-border/2:pw-3*border/2,mid+mid/2-border/2:L-pl-4*border) = -1;
louvre(round(pw/2)-border/2:pw-3*border/2,L-pl-7*border/2:L-pl-5*border/2) = -1;
end
%DENO
louvre(W-(round(pw/2)-border/2):-1:W-(pw-3*border/2),mid+3*border/2:L-pl-border-border-mid/2) = -1; 
louvre(W-(round(pw/2)-border/2):-1:W-(pw-3*border/2),mid+mid/2-border/2:L-pl-4*border) = -1;
louvre(W-(round(pw/2)-border/2):-1:W-(pw-3*border/2),L-pl-7*border/2:L-pl-5*border/2) = -1;

% %exit
% louvre(pw-border/2+1:pw-border/2+5,3*round(pw/2):3*round(pw/2)+4) = 3;
% louvre(W-round(pw/2)+border/2:W-round(pw/2)+border/2+4,round(pw/2):round(pw/2)+4) = 3;
% 
% exit = [];
% for x = pw-border/2+1:pw-border/2+5
%     for y = 3*round(pw/2):3*round(pw/2)+4
%         exit = [exit;x,y];
%     end
% end
% 
% for x = W-round(pw/2)+border/2:W-round(pw/2)+border/2+4
%     for y = round(pw/2):round(pw/2)+4
%         exit = [exit;x,y];
%     end
% end

% louvre(pw,3*round(pw/2))=1;
