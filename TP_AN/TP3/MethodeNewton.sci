function approx = MethodeNewton(f, fprime, x_0, N)
    xn = x_0;
    approx = xn-f(xn)/fprime(xn);
    n = 1;
    while n < N
        xn = approx;
        approx = approx-f(approx)/fprime(approx);
        n = n+1;
    end
    return;   
endfunction
