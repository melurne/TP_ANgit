function q1()
    for i=0:2:20
        if i ~= 14
            disp(i)
        end
    end
endfunction

//P=5 -3*%s^2 +8*%s^5;
//roots(P)

n=5
S=[eye(n,n), zeros(n,1)]
S=S(:,2:n+1)
A=2*eye(n)-S-S'


M=[1, 1; 1, 2];
B=[3;5];
X=inv(M)*B

q1()
