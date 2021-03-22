function [approx, n] = MethodePointFixe(f, lambda, x_0, N, eps)
    xn = x_0;
    approx = xn-lambda*f(xn);
    n = 0;
    while n < N && approx-xn >eps
        xn = approx;
        approx = approx-lambda*f(approx);
        n = n+1;
    end
    return;
endfunction
