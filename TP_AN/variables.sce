function[x,y]=myfunction(a,b)
    x=a+b
    y=a-b
    disp(p)
endfunction

p=10
function[x,y]=myfunction2(a,b)
    x=a+b
    y=a-b
    p=a*b
    disp(p)
    p
    [x,y]=myfunction(x,y)
endfunction
[x,y]=myfunction2(5,6)
p
