% Part II: Question 1
function [A_mat, b_vec] = random_test_case(n)
    A_mat = 200*rand(n)-100;
    b_vec = 200*rand(n, 1)-100;
end