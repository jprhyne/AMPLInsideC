all: preMadeFiles

preMadeFiles: src/preMadeFiles.c include/preMadeFiles.h
	gcc src/preMadeFiles.c -o bin/preMadeFiles
