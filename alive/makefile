alive: alive.o
	gcc alive.o -o alive -no-pie
alive.o: alive.asm
	nasm -f elf64 -g -F dwarf alive.asm -l alive.list
