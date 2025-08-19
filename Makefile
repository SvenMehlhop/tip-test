CVA6_PATH := ../../NewTip/cva6

all:
	run_test
	run_tcccp_test


tip_test.bin: clean tip_test.s tip_test.ld
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv64im_zicsr -mabi=lp64 -Wl,-Ttip_test.ld tip_test.s -o tip_test.elf
	riscv64-unknown-elf-objcopy -O binary tip_test.elf tip_test.bin
	#riscv64-unknown-elf-objdump -b binary -m riscv:rv64 -D  tip_test.elf >  tip_test-bin.dump
	riscv64-unknown-elf-objdump  -m riscv:rv64 -D  tip_test.elf >  tip_test-bin.dump

tip_tccp_test.bin: clean tip_tccp_test.s tip_test.ld
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv64im_zicsr -mabi=lp64 -Wl,-Ttip_test.ld tip_tccp_test.s -o tip_tccp_test.elf
	riscv64-unknown-elf-objcopy -O binary tip_tccp_test.elf tip_tccp_test.bin
	#riscv64-unknown-elf-objdump -b binary -m riscv:rv64 -D  tip_tccp_test.elf >  tip_tccp_test-bin.dump
	riscv64-unknown-elf-objdump  -m riscv:rv64 -D  tip_tccp_test.elf >  tip_tccp_test-bin.dump


build_verilate:
	make -C $(CVA6_PATH) verilate TRACE_COMPACT=1 DEBUG=1 TRACE_FAST=1 

run_test: clean tip_test.bin build_verilate
	$(CVA6_PATH)/work-ver/Variane_testharness -f dump.fst tip_test.elf

run_tcccp_test: clean tip_tccp_test.bin build_verilate
	$(CVA6_PATH)/work-ver/Variane_testharness -f dump.fst tip_tccp_test.elf

clean:
	rm -rf *.out *.bin *.elf *.dump *.fst *.hier *.trace *.dasm 
	$(MAKE) -C $(CVA6_PATH)/ clean



