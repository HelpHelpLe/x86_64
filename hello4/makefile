hello4: hello4.o
	gcc hello4.o -o hello4 -no-pie
hello4.o: hello4.asm
	nasm -f elf64 -g -F dwarf hello4.asm -l hello4.lst
