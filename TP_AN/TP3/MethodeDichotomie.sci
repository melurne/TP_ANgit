function [a_k, b_k, n] = MethodeDichotomie(f, a, b, eps)
    a_k = a;
    b_k = b;
    n = 0;
    c = (a+b)/2;
    while b_k-a_k > eps
        n = n+1;
        if f(a_k)*f(c) < 0
            b_k = c;
        else
            a_k = c;
        end
        c = (a_k+b_k)/2;
    end
    return;
endfunction


