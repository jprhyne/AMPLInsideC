all: runner 

runFiles.o: src/runFiles.c include/runFiles.h include/runFiles.h
	gcc -c src/runFiles.c

createFiles.o: src/createFiles.c include/createFiles.h include/runFiles.h
	gcc -c src/createFiles.c

runner.o: src/runner.c include/createFiles.h include/runFiles.h
	gcc -c src/runner.c

runner: runFiles.o createFiles.o runner.o
	gcc runFiles.o createFiles.o runner.o -o runner; cp runner preMadeFiles/

clean:
	rm runner preMadeFiles/runner sudoku.dat sudoku.mod sudoku.command out.txt output.txt runFiles.o createFiles.o runner.o preMadeFiles/out.txt preMadeFiles/output.txt
