function [phes,phesAdd] = initPhes(Louvre)
phes = Louvre;
phesAdd = Louvre;
found = find(phes==-1|phes==0|phes==2|phes==3);
for k=found'
    phes(k) = 1;
    phesAdd(k) = 0;
end
found = find(phes==-1);
for k=found'
    phes(k) = 0;
end
