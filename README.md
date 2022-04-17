# COMPENG 3SK3 Algorithms
Three algorithms completed in the Computer-Aided Engineering course (COMPENG 3SK3) at McMaster University.
## 1. Gaussian Elimination
Gaussian Elimination is a method of solving a set of two or more linear equations. The idea behind the method is to eliminate variables, one at a time, from each equation in the set until only one variable remains. With that final variable, its value can be easily determined and then substituted back into the previous equation(s) to solve for the other unknown variables.

Gaussian Elimination is best demonstrated in matrix representation. Take the following four linear equations with four unknowns: <b>(1)</b> <img src="https://render.githubusercontent.com/render/math?math=w%2B2x-y%2Bz=6"> <b>(2)</b> <img src="https://render.githubusercontent.com/render/math?math=-w%2Bx%2B2y-z=3"> <b>(3)</b> <img src="https://render.githubusercontent.com/render/math?math=2w-x%2B2y%2B2z=14"> <b>(4)</b> <img src="https://render.githubusercontent.com/render/math?math=w%2Bx-y%2B2z=8">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/45772611/160991122-26466d53-11fe-4099-b9b7-6d75998cdb09.png" width="200"/>

The general outline of the Gaussian Elimination algorithm is as follows:
For a set of <i>n</i> linear equations with <i>n</i> unknowns, 
1. <b>Forward Elimination:</b> perform a sequence of elementary row operations to eliminate n-1 variables in order to place the system of equations into row echelon form.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/45772611/160993586-3121f9d3-aa75-4bd5-8848-c3f66350dad3.png" width="200"/>

2. <b>Back Substitution</b> Beginning with the <i>n</i>th row, solve for the <i>n</i>th unknown variable. Use the value of the newly known variable to solve for the <i>n-1</i>th variable; then use those two known variables to solve for the <i>n-2</i>th variable; and so on.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/45772611/160995240-fde5c927-8c7b-4b70-afdf-2821500d2d5b.png" width="200"/>


### The Program
Function `Gauss_Elimination()` utilizes the following two main functions:
1. `Forward_Elimination()`: to perform the elementary row operations that will convert the matrix into row echelon form.
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Employs subfunctions: `reduce_column()`and `reduce_row_at_col()` to eliminate the necessary variables per row.
    
2. `Back_Substitution()`: After  row echelon has been achieved, use this function to determine the values of all unknown variables in the set of equations

Function `Gauss_Elimination_Pivoting()` is almost identical to `Gauss_Elimination()`, with the addition of `pivot()` function to account for any necessary row swapping to maintain the row echelon form of the matrix. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/45772611/161416160-c713768a-16ce-4242-930a-1dfae2dadb5f.png" width="200"/>

`pivot()` employs sub function `swap_rows()` to execute the row swapping in the matrix.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/45772611/161416243-1b73c1b9-feec-40d6-9e06-7cf1575f61cb.png" width="200"/>

## 2. Image Compression using SVD
## 3. Localization
