CC=riscv64-unknown-elf-gcc
AS=riscv64-unknown-elf-as
default: hello

hello: hello.o hello.ld
	$(CC) -T hello.ld -march=rv64i -mabi=lp64 -nostdlib -static -o bin/hello hello.o

hello.o: hello.s
	$(AS) -march=rv64i -mabi=lp64 hello.s -o hello.o

run: hello
	qemu-system-riscv64 -nographic -serial mon:stdio -machine virt -bios ./bin/hello
