#include"../include/runFiles.h"
#include"../include/createFiles.h"

int main(){
    runAMPL("../ampl_linux-intel64/ampl", "sudoku.command","output.txt");
    int *finalGrid = readOutFile("output.txt");
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            printf("%d ", finalGrid[i + j * 9]);
        }
        printf("\n");
    }
    free(finalGrid);
}
