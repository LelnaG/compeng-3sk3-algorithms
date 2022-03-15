function [new_mat, new_b_vec] = reduce_row_at_col(A_mat, b_vec, ... 
    col, row_added, row_reduced);

new_mat = A_mat;
new_b_vec = b_vec;

factor = new_mat(row_reduced,col)/new_mat(row_added,col);

new_mat(row_reduced,:) = new_mat(row_reduced,:) - new_mat(row_added,:)*factor;

new_b_vec(row_reduced) = new_b_vec(row_reduced) - new_b_vec(row_added) * factor;

end