function [y] = f(x)
    y = 0.1*x^3 + 0.5*x -8;
    return;
end

function [y] = f2(x)
    y = x^2-2;
    return;
endfunction

function y = f3(x)
    y = 1/x-3;
    return;
endfunction

function y = f3prime(x)
    y = -1/x^2;
    return;
endfunction

function y = taux_de_rente(x)
    M = 6000;
    A = 1000;
    n = 5;
    y = M - A*((1+x)/x)*((1+x)^n-1);
    return;
endfunction

a = 3;
b = 4;
eps = 0.0001;

exec("MethodeDichotomie.sci");
exec("MethodePointFixe.sci");
exec("MethodeNewton.sci");
exec("MethodeSecante.sci");

[ak, bk, n] = MethodeDichotomie(f, a, b, eps);

lambda = 1/4;
x_0 = 1;
N = 100;

[approx, n] = MethodePointFixe(f2, lambda, x_0, N, eps);

x_0 = 0.2;

approx = MethodeNewton(f3, f3prime, x_0, N);

x_0 = 0.2;
x_1 = 0.28;
N = 7;
approx = MethodeSecante(f3, x_0, x_1, N);

x_0 = 1000000;

[x, v] = fsolve(x_0, taux_de_rente)
