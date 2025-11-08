CC=riscv64-unknown-elf-gcc
AS=riscv64-unknown-elf-as
default: hello

hello: hello.o hello.ld
	$(CC) -T hello.ld -march=rv32i -mabi=ilp32 -nostdlib -static -o bin/hello hello.o

hello.o: hello.s
	$(AS) -march=rv32i -mabi=ilp32 hello.s -o hello.o

run: hello
	qemu-system-riscv32 -nographic -serial mon:stdio -machine virt -bios ./bin/hello
