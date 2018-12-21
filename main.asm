	module main

	include "wind.mac"
PROG
;	LD	HL,5B00H
;	LD	BC,2800H
;	CALL	dmm.IDMM

	_printw WRK_WIND
	_endw
	_prints	msg_keys
	_cur_on

mloop   call    spkeyb.CONIN	;main loop entry
	jp	z,mloop		;wait a press key
	cp	01Dh
	jp	z,exit		;if RShift+Q pressed, exit
	push 	af		;for debug
	call	wind.PRINTC
	LD	A,32
	call	wind.PRINTC
	pop	af
	call 	wind.A_HEX
	LD	A,32
cl_lbl	call	wind.PRINTC
	jp 	mloop

exit	_cur_off
	_endw
	RET

WRK_WIND:
	DB 0,0
	DB 32,24
	DB 00001111B
	DB 00000011B
	DB 0,0
	DB 0
	DB 1,'Show keyboad codes',0

msg_keys
        DB "Press RShift+Q for exit.",13,13,0

	endmodule