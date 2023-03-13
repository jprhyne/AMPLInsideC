all: createFiles

runFiles.o: src/runFiles.c include/runFiles.h include/runFiles.h
	gcc -c src/runFiles.c

createFiles.o: src/createFiles.c include/createFiles.h include/runFiles.h
	gcc -c src/createFiles.c

createFiles: createFiles.o runFiles.o
	gcc createFiles.o runFiles.o -o createFiles; rm createFiles.o runFiles.o

clean:
	rm createFiles sudoku.dat sudoku.mod sudoku.command out.txt
