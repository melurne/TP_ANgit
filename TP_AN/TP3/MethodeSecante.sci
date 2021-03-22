function approx = MethodeSecante(f, x_0, x_1, N)
    xn_1 = x_0;
    xn = x_1;
    approx = xn - f(xn)/((f(xn)-f(xn_1))/(xn-xn_1));
    n = 1;
    while n < N
        xn_1 = xn;
        xn = approx;
        approx = xn - f(xn)/((f(xn)-f(xn_1))/(xn-xn_1));
        n = n+1;
    end
    return;
endfunction
