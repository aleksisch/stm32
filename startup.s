.syntax unified
.cpu cortex-m3
.thumb
.include "Constants.s"

.macro  mov32 regnum,number
  MOVW \regnum,:lower16:\number
  MOVT \regnum,:upper16:\number
.endm

.text
@.global Reset_Handler
@Reset_Handler:

.global Default_Handler
Default_Handler:
BLINK_LOOP:
    b BLINK_LOOP
.end