function new_part_solution_vec = back_subst_for_col(ut_mat, new_b_vec,... 
    column, part_solution_vec)
    new_part_solution_vec = part_solution_vec;
    subtraction_factor = ut_mat(column, :)*part_solution_vec;
    
    new_part_solution_vec(column) = (new_b_vec(column)-subtraction_factor)/ut_mat(column, column);

end