function a = test2(i)
str = string('1111');
sprintf('%s',str)
if i == 5
    a = 5;
else
    test2(i+1);
end