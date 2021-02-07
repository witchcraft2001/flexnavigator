                DEVICE ZXSPECTRUM128
                include "..\FPLUGIN.INC"

                org     #BFF0                   ; PluginOrg - Header lenght
PluginStart:
                                                ; Flex Navigator plugin header
                db      "FLX-PLUG"              ; Id
                dw      0x0000                   ; LoadOffset
                dw      0x0000                   ; EntryOffset
                db      0x00                     ; PluginMode
                db      0x00, 0x00, 0x00   	; Reserved

		include "dos_equ.inc"

PluginEntry:
                call    MakeWindow
                db      0x01
                dw      78,79,484,72
                db      0x02                     ;head place
                dw      4,2,464,10
                db      0x44
                db      0x01                     ;text line
                dw      8,4
                db      0x4F
                db      "SHAOS CD-Player v1.0 beta1",0
                db      0x05
                dw      468,2,12,10
                db      0x80
                db      "x",0
                db	0x03
		dw	8,15,268,38
		db	0x02
		dw	10,16,264,36
		db	0x00
                db      0x04
                dw      282,15,116,18
                db      0x04
                dw      402,15,36,18
                db      0x04
                dw      442,15,36,18
                db      0x04
                dw      282,35,36,18
                db      0x04
                dw      322,35,36,18
                db      0x04
                dw      362,35,36,18
                db      0x04
                dw      402,35,36,18
                db      0x04
                dw      442,35,36,18
                db      0x06
                dw      2,56,480

                db      0x00

                call    ResFire

		call	shows

		ld	hl,cd_play
		ld	ix,201
		ld	iy,95
		call	show
		ld	hl,cd_paus
		ld	ix,241
		ld	iy,95
		call	show
		ld	hl,cd_stop
		ld	ix,261
		ld	iy,95
		call	show

		ld	hl,cd_ll
		ld	ix,181
		ld	iy,115
		call	show
		ld	hl,cd_l
		ld	ix,201
		ld	iy,115
		call	show
		ld	hl,cd_r
		ld	ix,221
		ld	iy,115
		call	show
		ld	hl,cd_rr
		ld	ix,241
		ld	iy,115
		call	show
		ld	hl,cd_ejec
		ld	ix,261
		ld	iy,115
		call	show

		call	shaos

		call	CDinit

plugin_loop:
                ld      ix, PluginMouseTab
                call    TestCoords
                ld      c, 0x31
                rst     0x10
                jr      z, plugin_loop
                ld      a, b
                or      a
                jr      nz, plugin_loop
                ld      a, e
                cp      0x1B
                jr      z, PluginExit
                cp      0x0D
                jr      nz, plugin_loop
PluginExit:
                call    MakeWindow
                db      0x7F
                db      0x00
                or      a                       ; cf = 0
                ret
Ok:
                ld	HL,String
		ld	DE,0x00CA
		ld	BC,0x00A0
		ld	A,0x80
		call	PrnTxtLnIFF
		ret

; hl - bitmap 32x16 for 16-color mode
; ix,iy - coords (320x256)

show:	in	a,(82h)
	ld	(shwin),a
	ld	a,50h
	out	(82h),a
	push	ix
	pop	de
	push	iy
	pop	bc
	ld	b,16
show1:	ld	a,c
	out	(89h),a
	push	de
	di
	ld	d,d
	ld	a,16
	ld	b,b
	ld	l,l
	ld	a,(hl)
	ld	(de),a
	ld	b,b	
	ei
	ld	de,16
	add	hl,de
	pop	de
	inc	c
	dec	b
	jp	nz,show1
	ld	a,0xFF
	out	(89h),a
	ld	a,(shwin)
	out	(82h),a
	ret

shwin	db	0

; a - digit
; ix,iy - coords (320x256)

showd:	rlca
	ld	e,0
	ld	d,a
	ld	hl,digit0
	add	hl,de
	call	show
	ld	de,16
	add	iy,de
	call	show
	ret	

; Show Digit string

shows:	ld	ix,46
	ld	iy,97
	ld	c,8
	ld	hl,Digits
shows1: push	bc
	push	hl
	push	iy
	ld	a,(hl)	
	call	showd
	ld	bc,16
	add	ix,bc
	pop	iy
	pop	hl
	pop	bc
	inc	hl
	dec	c
	jp	nz,shows1
	ret


	include "cdrom.a"

CDinit:
	call	CD_INI	                        
	jr	nc,noCD
yesCD:	call	SAVE_BUF
	ld	hl,CD_BUF
	ld	bc,54    
	add	hl,bc
	ld	de,msg_
yesCD1:	ld	a,(hl)
	ld	(de),a
	or	a
	jr	z,yesCD0
	inc	hl
	inc	de
	jr	yesCD1
yesCD0:	ld	hl,msgY
	ld	a,0x80
	jr	CDprn
noCD:	ld	hl,msgN
	ld	a,0x81
CDprn:  ld	de,84
	ld	bc,140
	call	PrnTxtLnIFF
	ret

msgY	db	"CD-ROM is present "
msg_	ds	100	
msgN	db	"CD-ROM is absent",0

CDplay:
	ld	hl,AP_PLA
	call	ATAPI
	ret

CDejec:
	ld	hl,AP_CD2
	call	ATAPI
	ret


Digits	db	0x00,0x00,0x0B,0x00,0x00,0x0A,0x00,0x00


PluginMouseTab:
		dw	546,558,81,91,0x21,0,PluginExit,PluginExit

		dw	360,476, 94,112,0x01,0,CDplay,0
		dw	480,516, 94,112,0x01,0,0,0
		dw	520,556, 94,112,0x01,0,0,0
		dw	360,396,114,132,0x01,0,0,0
		dw	400,436,114,132,0x01,0,0,0
		dw	440,476,114,132,0x01,0,0,0
		dw	480,516,114,132,0x01,0,0,0
		dw	520,556,114,132,0x01,0,CDejec,0

PluginMT2:      
                dw	252,324,138,156,0x01,0,Ok,0
                dw      0x8000

StringBuf:
		db	16,1
		db	0,0,0
		dw	0x00CC,0x0057,0x00E8
		db	0xF0
String:		ds	16
		ds	13

		include "shaos.asm"
		include "cd.asm"
		include "digits.asm"

PluginEnd:
                savebin	"cdplayer.flx",PluginStart,PluginEnd-PluginStart