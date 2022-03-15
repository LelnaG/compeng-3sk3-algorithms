function [new_mat, new_b_vec] = pivot(A_mat, b_vec, col);

flag = 1;
i = 1;
while flag == 1 && i<height(A_mat)
    if A_mat(col+i , col) == 0
        flag == 1;
        i = i+1;
    else
        flag = 0;
    end
end

if flag == 0 && i<height(A_mat)
    [new_mat, new_b_vec] = swap_rows(A_mat, b_vec, col, col+i);
end

end