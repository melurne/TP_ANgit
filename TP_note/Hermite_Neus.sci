function [r_i] = r(i, A)
    n = length(A);
    x = poly(0, "x");
    r_i = 1;
    for k=1:n
        if k~=i
            r_i = r_i * ((x-A(k))/(A(i)-A(k)))^2
        end
    end
    return;
endfunction

function [r_i_prime] = r_prime(i, A)
    n = length(A);
    x = poly(0, "x");
    r_i_prime = 0;
    for k =1:n
        if k~=i
            r_i_prime = r_i_prime + 2/(A(i)-A(k));
        end
    end    
    return;
endfunction

function [Q_i] = Q_i(i, A, B, Bprime)
    n = length(A);
    x = poly(0, "x");
    Q_i = B(i) + (x - A(i))*(Bprime(i)-r_prime(i, A)*B(i));
    return;
endfunction

function [Q] = InterpolationHermite(A, B, Bprime)
    n = length(A);
    x = poly(0, "x");
    Q = 0;
    for i=1:n
        Q = Q + r(i, A)*Q_i(i, A, B, Bprime); 
    end
    return;
endfunction
