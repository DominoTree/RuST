/* GEMDOS .prg linker script. Sections laid out for toslink ELF -> .prg. */

ENTRY(_start)

SECTIONS
{
    .text : ALIGN(4) {
        *(.text._start)
        *(.text)
        *(.text.*)
        . = ALIGN(4);
    }

    .data : ALIGN(4) {
        *(.data)
        *(.data.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
    }

    .bss : ALIGN(4) {
        *(.bss)
        *(.bss.*)
        . = ALIGN(4);
    }

    /DISCARD/ : {
        *(.comment)
        *(.note.*)
        *(.eh_frame*)
        *(.debug*)
    }
}
