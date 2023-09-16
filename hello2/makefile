hello2: hello2.o
	gcc hello2.o -o hello2 -no-pie
hello2.o: hello2.asm
	nasm -f elf64 -g -F dwarf hello2.asm -l hello2.list
