all: runFiles

runFiles: src/runFiles.c include/runFiles.h
	gcc src/runFiles.c -o bin/runFiles
