function X = GaussPivotPartiel(A,B)
    n=size(A,1);
    if det(A)==0
        error("det = 0")
    end
    for i = 1:n-1
        l=i;
        for k=i:n
            if abs(A(k,i)) > abs(A(l,i))
                l=k;
            end
        end
        if l~=i
            for j=i:n
                tmp=A(l,j);
                A(l,j)=A(i,j);
                A(i,j)=tmp;
            end
            tmp=B(l);
            B(l)=B(i);
            B(i)=tmp
        end
        
        pivot=A(i,i);
        for k = i+1:n
            factpivot=A(k,i)/pivot;
            A(k,i)=0;
            for j=i+1:n
                A(k,j)=A(k,j)-factpivot*A(i,j);
            end
            B(k)=B(k)-factpivot*B(i)
        end
    end
    
    X=zeros(n);
    X(n)=B(n)/A(n,n);
    
    for i=n-1:1
        for j=i+1:n
            B(i)=B(i)-A(i,j)*X(j)
        end
        X(i)=B(i)/A(i,i)
    end
return
endfunction

function [Xk1] = iteration(A, B, Xk)
    n = size(Xk,1);
    Xk1 = zeros(n, 1);
    somme = 0;
    for j = 2:n
        somme = somme + A(1,j)*Xk(j)
    end
    Xk1(1) = (1/A(1,1))*(-somme+B(1));
    for i = 2:n
        for j =1:i-1
            Xk1(i) = Xk1(i)-A(i,j)*Xk1(j);
        end
        for j = i+1:n
            Xk1(i) = Xk1(i) - A(i,j)*Xk(j);
        end
        Xk1(i) = (1/A(i,i))*(Xk1(i) + B(i));
    end
    return
endfunction

function [out] = norme(X)
    out = 0
    for i=1:size(X,"*")
        out = out + X(i)^2;
    end
    out = sqrt(out)    
    return
endfunction

function [X, iter] = GaussSeidel(A, B, X0, eps, N)
    X = X0;
    iter = 0;
    while (iter < N)&&(norme(A*X-B) > eps)
        X = iteration(A, B, X);
        iter = iter + 1;
    end
    return
endfunction
