CC=riscv64-unknown-elf-gcc
AS=riscv64-unknown-elf-as
OBJCOPY=riscv64-unknown-elf-objcopy
default: hello

hello: hello.o hello.ld
	$(CC) -T hello.ld -march=rv64i -mabi=lp64 -nostdlib -static -o bin/hello hello.o
	$(OBJCOPY) -O binary bin/hello bin/hello.bin

hello.o: hello.s
	$(AS) -march=rv64i -mabi=lp64 hello.s -o hello.o

run: hello
	qemu-system-riscv64 \
	-machine virt \
	-bios bin/hello.bin \
	-nographic \
	-serial mon:stdio
