set x := {1, 2, 3, 4, 5, 6, 7, 8, 9}; # x-coordinate inside our grid
set y := {1, 2, 3, 4, 5, 6, 7, 8, 9}; # y-coordinate inside our grid
set value := {1, 2, 3, 4, 5, 6, 7, 8, 9}; # value that is taken at coordinate (i,j)

#3D variable representing our initial data
param givenInfo {x,y,value} binary;
# 3D variable where the value at grid[i,j,k] = 1 
# if and only if the number k is present at the
# coordinate (i,j) inside our 9x9 grid
var grid {x,y,value} binary;
# Sudoku doesn't require an objective function
# So, we just add a function to let
# AMPL run. This can be anything 
minimize dummyFunc: 0;

# Constraint that ensures we only have 1 number
# per column
subject to onePerColumn {(j,k) in {y,value}}:
	sum {i in x} grid[i,j,k] = 1;
	
# Constraint that ensures we only have 1 number
# per row
subject to onePerRow {(i,k) in {x,value}}:
	sum {j in y} grid[i,j,k] = 1;

# Set that helps with our onePerBox constraint
set offset = {1, 4, 7};

# Set that helps with our onePerBox constraint
set boundaries = {0,1,2};

# Constraint that ensures we only have 1 number
# per 3x3 box
subject to onePerBox {(i,j,k) in {offset, offset, value}}:
	sum {(a,b) in {boundaries,boundaries}} grid[i + a, j + b, k] = 1;

# Constraint that ensures we only have 1 number
# per cell in our grid
subject to onePerCell {(i,j) in {x, y}}:
	sum {k in value} grid[i,j,k] = 1;

# Constraint that ensures we don't violate the given data
subject to startData {(i,j,k) in {x,y,value}}:
	grid[i,j,k] >= givenInfo[i,j,k];
