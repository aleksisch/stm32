
Files = startup Constants int_table
ASM = $(Files:=.s)
OBJ = $(Files:=.o)
ELF = main.elf
LD  = stm.ld
BIN = main.bin
addr = 0x08000000

all: $(OBJ)
	arm-none-eabi-ld -o $(ELF)  $(OBJ) -T$(LD)
	arm-none-eabi-objcopy -O binary $(ELF) $(BIN)

%.o: %.s
	arm-none-eabi-as -o $@ $(@:.o=.s)

flash:
	st-flash write ./$(BIN) $(addr)
clean:
	rm -f *.o
	rm -f *.bin
	rm -f *.elf

