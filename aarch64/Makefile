BINARIES=loop_aarch64 loop2_aarch64 table_aarch64

all:    ${BINARIES}
AS_ARGS=-g
AS=as

loop_aarch64:	loop_aarch64.s
				${AS} ${AS_ARGS} -o loop_aarch64.o  loop_aarch64.s
				ld -o loop_aarch64 loop_aarch64.o

loop2_aarch64:	loop2_aarch64.s
				${AS} ${AS_ARGS} -o loop2_aarch64.o loop2_aarch64.s
				ld -o loop2_aarch64 loop2_aarch64.o

table_aarch64:	table_aarch64.s
				${AS} ${AS_ARGS} -o table_aarch64.o table_aarch64.s
				ld -o table_aarch64 table_aarch64.o
clean:  
				rm ${BINARIES} *.o || true
