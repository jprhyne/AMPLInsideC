
model sudoku.mod;
data  sudoku.dat;
option solver "../ampl_linux-intel64/cplex";
solve;
display {k in value}: {i in x, j in y} grid[i,j,k];
