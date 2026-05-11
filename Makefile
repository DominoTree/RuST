# Build HELLO.PRG for EmuTOS / Atari TOS on m68k.
#
# Pipeline:
#   1. cargo build --release -> ELF in target/m68k-tos/release/
#   2. toslink converts the ELF to a GEMDOS .prg

ELF := target/m68k-tos/release/rust-tos-hello
PRG := HELLO.PRG

.PHONY: all clean elf prg

all: prg

elf:
	cargo build --release

prg: elf
	toslink -o $(PRG) $(ELF)

clean:
	cargo clean
	rm -f $(PRG)
