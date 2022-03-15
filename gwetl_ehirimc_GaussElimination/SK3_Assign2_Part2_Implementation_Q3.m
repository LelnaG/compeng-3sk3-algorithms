format short g 
n = [10, 20, 50, 100, 200];
tEnd = zeros(1, 10);
tEnd_av = zeros(1, 5);
for i = 1:5
    for j = 1:10
        [A_mat, b_vec] = random_test_case(n(1, i));
        TStart = tic;
        solution_mat = Gauss_Elimination(A_mat, b_vec);
        tEnd(j) = toc(TStart);
    end
    tEnd_av(i) = sum(tEnd)/height(tEnd);
end
tEnd_av

plot(n, tEnd_av)
hold on

n = [10, 20, 50, 100, 200];
tEnd = zeros(1, 10);
tEnd_av2 = zeros(1, 5);
for i = 1:5
    for j = 1:10
        [A_mat, b_vec] = random_test_case(n(1, i));
        TStart = tic;
        solution_mat = Gauss_Elimination_Pivoting(A_mat, b_vec);
        tEnd(j) = toc(TStart);
    end
    tEnd_av2(i) = sum(tEnd)/height(tEnd);
end
tEnd_av2

plot(n, tEnd_av2)
title('Runtime vs n')
xlabel('Matrix dimension, n')
ylabel('Runtime')
legend('runtime without Pivot', 'runtime with Pivot')
hold off


% [A_mat, b_vec] = random_test_case(3);
% solution_mat = Gauss_Elimination(A_mat, b_vec)
% X = linsolve(A_mat, b_vec);
% X(:, 1)
% 
% [A_mat, b_vec] = random_test_case(4);
% solution_mat = Gauss_Elimination(A_mat, b_vec)
% X = linsolve(A_mat, b_vec);
% X(:, 1)