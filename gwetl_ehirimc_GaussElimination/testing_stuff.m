% A = [0 1 4; 3 6 7; 9 3 4]
% variance = zeros(1, 3);
% std_dev = zeros(1,3);
% mean = sum(A)/height(A);
% for i = 1:3
%     
%     variance(i) = sum((A(:, i)-mean(i)).^2)/(height(A)-1)
%     std_dev(i) = sqrt(variance(i));
%     
% end
% 
% mean
% variance
% std_dev

% function areEqual = check_matrix_solution(A_mat, b_vec, solution_mat)
%     checking that b_vec are equal
%     
%     create an nx1 matrix to store if they're equal
%     areEqual = zeros(height(b_vec), 1);
% 
%     solved_b_vec = A_mat*solution_mat;
%     height(b_vec)
%     height(solution_b_vec)
% 
%     for i = 1:height(b_vec)
%         define a tolerance
%         tol = 5*eps(b_vec(i));
% 
%         areEqual(i) = abs(solved_b_vec-b_vec) < tol
%     end
% end

A = [1 2 3; 0 5 6; 0 0 9];
vect = [1; 2; 3]
(A(2, :))*vect