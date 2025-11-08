ENTRY(_start)

SECTIONS {
    . = 0x80000000;

    .text : {
        *(.text)
    }

    /* REMOVE THIS LINE */
    /* . = ALIGN(CONSTANT(COMMONPAGESIZE)); */

    .data : {
        *(.data)
    }
}
