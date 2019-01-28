function Louvre = resetPeople(Louvre,peoples)

found = find(Louvre==1);
for k=found'
    Louvre(k) = 0;
end

[num,t] = size(peoples);

for i = 1:num
    Louvre(peoples(i,1),peoples(i,2),peoples(i,3)) = 1;
end