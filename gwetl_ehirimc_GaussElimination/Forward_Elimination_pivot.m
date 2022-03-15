function [cur_mat, cur_vec] = Forward_Elimination_pivot(A_mat, b_vec)

cur_mat = A_mat;
cur_vec = b_vec;

for i = 1:height(A_mat)
    cur_col = i;
    [cur_mat, cur_vec] = reduce_column_pivot(cur_mat, cur_vec, cur_col);
end

end