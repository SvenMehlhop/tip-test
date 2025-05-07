
all:
	run_test


tip_test.bin: tip_test.s tip_test.ld
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv64im_zicsr -mabi=lp64 -Wl,-Ttip_test.ld tip_test.s -o tip_test.elf
	riscv64-unknown-elf-objcopy -O binary tip_test.elf tip_test.bin
	riscv64-unknown-elf-objdump -b binary -m riscv:rv64 -D  tip_test.bin >  tip_test-bin.dump


build_verilate:
	make -C ../cva6/ verilate TRACE_COMPACT=1 DEBUG=1 TRACE_FAST=1 

run_test: clean tip_test.bin build_verilate
	../cva6/work-ver/Variane_testharness -f dump.fst tip_test.elf

clean:
	rm -rf *.out *.bin *.elf *.dump *.fst *.hier *.trace *.dasm 
	$(MAKE) -C ../cva6/ clean



