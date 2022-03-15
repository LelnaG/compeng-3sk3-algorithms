format short g
% testing Part II: Question 1
% random_test_case(6)

%Part II: Question 2

% WITHOUT PIVOTING
[A_mat, b_vec] = random_test_case(2);
solution_mat = Gauss_Elimination(A_mat, b_vec)
X = linsolve(A_mat, b_vec)
checked = check_matrix_solution(A_mat, b_vec, solution_mat)



[A_mat, b_vec] = random_test_case(3);
solution_mat = Gauss_Elimination(A_mat, b_vec)
checked = check_matrix_solution(A_mat, b_vec, solution_mat)
X = linsolve(A_mat, b_vec)



[A_mat, b_vec] = random_test_case(4)
solution_mat = Gauss_Elimination(A_mat, b_vec)
checked = check_matrix_solution(A_mat, b_vec, solution_mat)
X = linsolve(A_mat, b_vec)



% WITH PIVOTING
[A_mat, b_vec] = random_test_case(2);
solution_mat = Gauss_Elimination_Pivoting(A_mat, b_vec)
X = linsolve(A_mat, b_vec)
checked = check_matrix_solution(A_mat, b_vec, solution_mat)


[A_mat, b_vec] = random_test_case(3);
solution_mat = Gauss_Elimination_Pivoting(A_mat, b_vec)
X = linsolve(A_mat, b_vec)
checked = check_matrix_solution(A_mat, b_vec, solution_mat)

[A_mat, b_vec] = random_test_case(4);
solution_mat = Gauss_Elimination_Pivoting(A_mat, b_vec)
X = linsolve(A_mat, b_vec)
checked = check_matrix_solution(A_mat, b_vec, solution_mat)