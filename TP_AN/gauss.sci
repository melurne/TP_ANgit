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
            B(l)=B(j);
            B(j)=tmp
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

A=[1, 4; 2, 7]
B=[1,1]
A=[1, 2, 3; 4, 5, 6; 7, 8, 10]
B=[1,1,1]

X=GaussPivotPartiel(A,B)

