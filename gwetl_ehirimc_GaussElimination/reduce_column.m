function [new_mat, new_b_vec] = reduce_column(A_mat, b_vec, column)

    col = column;
    row_added = column;
    new_mat = A_mat;
    new_b_vec = b_vec;

    for i=column:(height(A_mat)-1)
        row_reduced = i + 1;
        [new_mat, new_b_vec] = reduce_row_at_col(new_mat, new_b_vec, col, row_added, row_reduced);
    end
end