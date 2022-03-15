function [cur_mat, cur_vec] = Forward_Elimination(A_mat, b_vec)

cur_mat = A_mat;
cur_vec = b_vec;

for i = 1:height(A_mat)
    cur_col = i;
    if cur_mat(i,i) == 0
        cur_mat = zeros(height(A_mat));
        cur_vec = zeros(height(A_mat),1);
        i = height(A_mat);

    else
        [cur_mat, cur_vec] = reduce_column(cur_mat, cur_vec, cur_col);
    end
end

end