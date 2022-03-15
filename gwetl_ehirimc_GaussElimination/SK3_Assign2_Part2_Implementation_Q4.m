format short g
%Part II: Question 4

%---------------------------FIRST: [-1.0, 1.0]---------------------------

% create a column vector to store the 100 error values
errors_stored = zeros(100, 5);
variance = zeros (1, 5);
std_dev = zeros (1, 5);
% generate 100 random 10 x 10 systems
n = 10;
for i = 1:100
    [A_mat, b_vec] = random_test_case(n);

    %record solution to system
    solution_mat = Gauss_Elimination(A_mat, b_vec)

    % "perturb system" --> add a number -1.0 to 1.0 to each element in
    % A_mat and b_vec

    %generate 10 by 10 matrix with numbers -1.0 to 1.0 and add it to A_mat
    A_mat_perturbed = A_mat+ (2*rand(n)-1);
    b_vec_perturbed = b_vec + (2*rand(n, 1)-1);
    perturbed_solution_mat = Gauss_Elimination(A_mat_perturbed, b_vec_perturbed)

    error_matrix = (solution_mat-perturbed_solution_mat).^2;
    sum_error = sum(error_matrix);
    error = sqrt(sum_error)
    errors_stored(i, 1) = error;
end



%---------------------------SECOND: [-0.1, 0.1]---------------------------
for i = 1:100
    [A_mat, b_vec] = random_test_case(n);

    %record solution to system
    solution_mat = Gauss_Elimination(A_mat, b_vec)

    % "perturb system" --> add a number -1.0 to 1.0 to each element in
    % A_mat and b_vec

    %generate 10 by 10 matrix with numbers -1.0 to 1.0 and add it to A_mat
    A_mat_perturbed = A_mat+ (0.2*rand(n)-0.1);
    b_vec_perturbed = b_vec + (0.2*rand(n, 1)-0.1);
    perturbed_solution_mat = Gauss_Elimination(A_mat_perturbed, b_vec_perturbed)

    error_matrix = (solution_mat-perturbed_solution_mat).^2;
    sum_error = sum(error_matrix);
    error = sqrt(sum_error)
    errors_stored(i, 2) = error;
end
%---------------------------THIRD: [-0.01, 0.01]---------------------------
for i = 1:100
    [A_mat, b_vec] = random_test_case(n);

    %record solution to system
    solution_mat = Gauss_Elimination(A_mat, b_vec)

    % "perturb system" --> add a number -1.0 to 1.0 to each element in
    % A_mat and b_vec

    %generate 10 by 10 matrix with numbers -1.0 to 1.0 and add it to A_mat
    A_mat_perturbed = A_mat+ (0.02*rand(n)-0.01);
    b_vec_perturbed = b_vec + (0.02*rand(n, 1)-0.01);
    perturbed_solution_mat = Gauss_Elimination(A_mat_perturbed, b_vec_perturbed)

    error_matrix = (solution_mat-perturbed_solution_mat).^2;
    sum_error = sum(error_matrix);
    error = sqrt(sum_error)
    errors_stored(i, 3) = error;
end
%---------------------------FOURTH: [-0.001, 0.001]------------------------
for i = 1:100
    [A_mat, b_vec] = random_test_case(n);

    %record solution to system
    solution_mat = Gauss_Elimination(A_mat, b_vec)

    % "perturb system" --> add a number -1.0 to 1.0 to each element in
    % A_mat and b_vec

    %generate 10 by 10 matrix with numbers -1.0 to 1.0 and add it to A_mat
    A_mat_perturbed = A_mat+ (0.002*rand(n)-0.001);
    b_vec_perturbed = b_vec + (0.002*rand(n, 1)-0.001);
    perturbed_solution_mat = Gauss_Elimination(A_mat_perturbed, b_vec_perturbed)

    error_matrix = (solution_mat-perturbed_solution_mat).^2;
    sum_error = sum(error_matrix);
    error = sqrt(sum_error)
    errors_stored(i, 4) = error;
end
%---------------------------FIFTH: [-0.00001, 0.00001]---------------------
for i = 1:100
    [A_mat, b_vec] = random_test_case(n);

    %record solution to system
    solution_mat = Gauss_Elimination(A_mat, b_vec);

    % "perturb system" --> add a number -1.0 to 1.0 to each element in
    % A_mat and b_vec

    %generate 10 by 10 matrix with numbers -1.0 to 1.0 and add it to A_mat
    A_mat_perturbed = A_mat+ (0.00002*rand(n)-0.00001);
    b_vec_perturbed = b_vec + (0.00002*rand(n, 1)-0.00001);
    perturbed_solution_mat = Gauss_Elimination(A_mat_perturbed, b_vec_perturbed)

    error_matrix = (solution_mat-perturbed_solution_mat).^2;
    sum_error = sum(error_matrix);
    error = sqrt(sum_error)
    errors_stored(i, 5) = error;
end

mean = sum(errors_stored)./height(errors_stored)


for i=1:5
    variance(i) = (sum(errors_stored(:, i) - mean(i)).^2)/(height(errors_stored)-1);
    std_dev(i) = sqrt(variance(i));
end
std_dev

% PLOTS
% mean vs k
% std_dev vs k
% k = 0 1 2 3 5
k = [0, 1, 2, 3, 5]
height(errors_stored)
errors_stored

figure(1)
plot(k, mean)
title('Mean vs k')
xlabel('k')
ylabel('Mean')

figure(2)
plot(k, std_dev)
title('Standard Deviation vs k')
xlabel('k')
ylabel('Standard Deviation')

