function X = Remontee(A,B)
    n=size(A,1);
    if or(A ~= triu(A))
        error("Not triu")
    end    
    for i = 1:n
        if A(i,i) == 0
            error("diag = 0");
        end
    end
    X=zeros(n);
    X(n) = B(n)/A(n,n);
    for i = n-1:1
        for j = i+1:n
            B(i)=B(i)-A(i,j)*X(j);
        end
        X(i) = B(i)/A(i,i);
    end   
endfunction    

function X = Descente(A,B)
    n=size(A,1);
    if or(A ~= tril(A))
        error("Not triu")
    end    
    for i = 1:n
        if A(i,i) == 0
            error("diag = 0");
        end
    end
    X=zeros(n);
    X(1) = B(1)/A(1,1);
    for i = 2:n
        for j = 1:i-1
            B(i)=B(i)-A(i,j)*X(j);
        end
        X(i) = B(i)/A(i,i);
    end   
endfunction  

A=[1, 2;0, 1]
B=[2, 5]
X=Remontee(A,B)

A2=[1, 0; 2, 1]
B2=[2, 5]
X2=Descente(A2, B2)


