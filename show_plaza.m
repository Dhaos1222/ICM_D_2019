function h = show_plaza(plaza, h, n)
%
% show_plaza  To show the plaza matrix as a image
% 
% USAGE: h = show_plaza(plaza, h, n)
%        plaza = plaza matrix
%                1 = car, 0 = empty, -1 = forbid, -3 = empty&booth
%        h = handle of the graphics
%        n = pause time
%
% zhou lvwen: zhou.lv.wen@gmail.com


[W, L] = size(plaza); %get its dimensions
temp = plaza;
temp(temp==1) = 0;

PLAZA(:,:,1) = plaza;
PLAZA(:,:,2) = plaza;
PLAZA(:,:,3) = temp;

PLAZA = 1-PLAZA;
PLAZA(PLAZA>1)=PLAZA(PLAZA>1)/6;


if ishandle(h)
    set(h,'CData',PLAZA)
    pause(n)
else
    figure('position',[20,20,1080,960])
    h = imagesc(PLAZA);
%     colormap(bone(128));
%     h = imagesc(plaza,[-1 100]);
    hold on;
    
    % draw the grid
    for i = 0:1:W
    plot([0,L],[i,i],'k-')
    end
    for i = 0:1:L
    plot([i,i],[0,W],'k-')
    end
    axis image
%     set(gca, 'xtick', [], 'ytick', []);
    pause(n)
end