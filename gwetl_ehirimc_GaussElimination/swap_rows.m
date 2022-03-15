function [new_mat, new_vec] = swap_rows(mat, vec, row1, row2);
    new_mat = mat;
    new_mat(row1,:) = mat(row2,:);
    new_mat(row2,:) = mat(row1,:);

    new_vec = vec;
    new_vec(row1) = vec(row2);
    new_vec(row2) = vec(row1);
end