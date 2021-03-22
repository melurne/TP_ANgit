exec("/home/m/n/mneus/TP_AN/TP2/gauss.sci");
h = 0.01;
n = 5;

A = 2*eye(n,n) + (-1)*(diag(ones(1, n-1), 1) + diag(ones(1, n-1), -1))
B = (h^2)*ones(n, 1)
//thetaG = GaussPivotPartiel(A, B)
//thetaG = inv(A)*B
X0 = 10*ones(n, 1);
eps = 0.001;
N = 100;
[X, i] = GaussSeidel(A, B, X0, eps, N)
