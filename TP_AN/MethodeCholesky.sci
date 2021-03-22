function L = Cholesky(A)
    n=size(A,1)    
    L=zeros(n,n);
    L(1,1)=sqrt(A(1,1));
    for i = 2:n
        L(i,1)=A(i,1)/L(1,1)
    end

    for j = 2:n
        for i= i:j-1
            L(i,j)=0; 
        end
        somme=0; 
        for k = 1:j-1
            somme = somme+ L(j,k)^2
        end        

        L(j,j) =sqrt(A(j,j)-somme);    
    
        for i = j+1:n
            somme=0
            for k=1:j-1
                somme = somme + L(i,k)*L(j,k);
            end
            L(i,j) = A(i,j)-somme;
        end 
    
    end
return
endfunction


A=[9, 6, 3; 6, 20, 6; 3, 6, 3]
L=Cholesky(A)
