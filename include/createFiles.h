#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include"runFiles.h"

#define NUM_ROWS_COLS 9
int *readOutFile(char *outFile);
void writeModelFile(char *modelFile);
void writeDataFile(char *dataFile, int grid[9][9]);
void writeCommandFile(char *dataFile, char *modelFile, char *solverPath, char *commandFile);
