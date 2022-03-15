function solution_vec = Gauss_Elimination(A_mat, b_vec)

% check for consistent size of A_mat and b_vec
if height(A_mat) ~= width(A_mat)
    disp('Error: Column matrix is not square ');
    solution_vec = zeros;

elseif (height(b_vec) ~= height(A_mat))
    disp('Error: Number of elements in vector b is not compatible');
    solution_vec = zeros;

else 
    % reduce coefficient matrix to upper triangular form, modifying the 
    % right-hand side vector appropriatly
    [ut_mat, new_b_vec] = Forward_Elimination(A_mat, b_vec);
    if ut_mat(1,1) == 0
        disp('Error: Pivot Element is zero');
        solution_vec = zeros;
    else
        % Compute the solution vector using back substitution 
        solution_vec = Back_Substitution(ut_mat, new_b_vec);
    end
end
end
























