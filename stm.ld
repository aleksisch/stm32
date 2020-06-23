MEMORY {
    FLASH (rwx)   : ORIGIN = 0x08000000,   LENGTH = 128K
    SRAM (rwx)    : ORIGIN = 0x20000000,  LENGTH =  20K
}

SECTIONS {
    .VectorTable : {
        *(.VectorTable)
    } > FLASH   

    .text : {
        *(.text)
    } >FLASH
    
    .data (NOLOAD) : {
        . = . + 0x400;
        _StackEnd = .;
        *(.data)
    } >SRAM
}