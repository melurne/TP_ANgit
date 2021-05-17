exec("Hermite_Neus.sci");

A = [0, 1, 2];
B = [1, 3, 9];
Bprime = [1.1, 3.3, 9.9];

disp("Exercice 2:");
disp("r_1(x) = ");
disp(r(1, A));
disp("r_2(x) = ");
disp(r(2, A));
disp("r_3(x) = ");
disp(r(3, A));
disp("");

disp("Exercice 3:");
disp("r_1_prime(x_1) =");
disp(r_prime(1, A));
disp("r_2_prime(x_2) =");
disp(r_prime(2, A));
disp("r_3_prime(x_3) =");
disp(r_prime(3, A));
disp("");

disp("Exercice 4:");
disp("Q_1(x) =");
disp(Q_i(1, A, B, Bprime));
disp("Q_2(x) =");
disp(Q_i(2, A, B, Bprime));
disp("Q_3(x) =");
disp(Q_i(3, A, B, Bprime));
disp("");

disp("Exercice 5:");
disp("Q(x) = ");
disp(InterpolationHermite(A, B, Bprime));
