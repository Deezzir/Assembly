BINARIES=loop_x86_64 loop2_x86_64 table_x86_64

all:    ${BINARIES}
AS_ARGS=-g
AS=nasm

loop_x86_64:	loop_x86_64.s
				${AS} ${AS_ARGS} -o loop_x86_64.o -f elf64 loop_x86_64.s
				ld -o loop_x86_64 loop_x86_64.o

loop2_x86_64:	loop2_x86_64.s
				${AS} ${AS_ARGS} -o loop2_x86_64.o -f elf64 loop2_x86_64.s
				ld -o loop2_x86_64 loop2_x86_64.o

table_x86_64:	table_x86_64.s
				${AS} ${AS_ARGS} -o table_x86_64.o -f elf64 table_x86_64.s
				ld -o table_x86_64 table_x86_64.o
clean:  
				rm ${BINARIES} *.o || true
