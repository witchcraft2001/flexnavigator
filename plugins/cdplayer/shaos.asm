; Shaos face

shaos:	ld	hl,shaosraw
	ld	de,44
	ld	c,95
	ld	b,36
	in	a,(82h)
	ld	(shaowin),a
	ld	a,50h
	out	(82h),a
shaos1:	ld	a,c
	out	(89h),a
	push	de
	di
	ld	d,d
	ld	a,32
	ld	b,b
	ld	l,l
	ld	a,(hl)
	ld	(de),a
	ld	b,b	
	ei
	ld	de,32
	add	hl,de
	pop	de
	inc	c
	dec	b
	jp	nz,shaos1
	ld	a,0xFF
	out	(89h),a
	ld	a,(shaowin)
	out	(82h),a
	ret

shaowin	db	0




shaosraw:
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x88,0x70,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x00,0x07,0x07,0x88,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x88,0x77,0x00,0x00,0x70,0x77,0x07,0x00,0x70,0x70,0x70,0x07,0x00,0x70,0x07,0x77,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0x77,0x00,0x00,0x70,0x70,0x70,0x07,0x07,0x07,0x07,0x00,0x07,0x00,0x70,0x07,0x00,0x07,0x08,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0x87,0x00,0x00,0x70,0x70,0x00,0x70,0x70,0x70,0x70,0x70,0x70,0x07,0x00,0x70,0x70,0x70,0x77,0x07,0x07,0x08,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0x87,0x00,0x70,0x70,0x70,0x07,0x00,0x07,0x00,0x07,0x00,0x07,0x07,0x07,0x07,0x00,0x07,0x07,0x07,0x07,0x07,0x07,0x78,0xFF,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xF7,0x00,0x70,0x70,0x70,0x70,0x07,0x07,0x00,0x07,0x00,0x77,0x07,0x00,0x70,0x00,0x70,0x70,0x77,0x70,0x70,0x70,0x70,0x07,0xFF,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF8,0x00,0x70,0x70,0x00,0x00,0x07,0x00,0x70,0x77,0x77,0x88,0x77,0x77,0x77,0x00,0x70,0x07,0x07,0x00,0x70,0x70,0x70,0x70,0x70,0x78,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF8,0x00,0x70,0x07,0x07,0x07,0x70,0x77,0x78,0x88,0x8F,0x88,0x88,0x88,0x88,0x77,0x77,0x07,0x07,0x07,0x00,0x70,0x70,0x70,0x00,0x77,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF7,0x77,0x70,0x70,0x70,0x77,0x78,0x88,0x88,0xF8,0xF8,0x88,0x88,0x78,0x78,0x88,0x77,0x70,0x70,0x77,0x70,0x70,0x07,0x07,0x70,0x07,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF8,0x7F,0x77,0x77,0x88,0x88,0x88,0x88,0x88,0x88,0x88,0x78,0x87,0x87,0x87,0x88,0x77,0x77,0x77,0x70,0x70,0x77,0x07,0x07,0x00,0x07,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF8,0x87,0x88,0x87,0x88,0x88,0x87,0x87,0x87,0x88,0x88,0x88,0x87,0x87,0x88,0x88,0x87,0x77,0x70,0x77,0x07,0x07,0x70,0x70,0x77,0x07,0x7F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0x77,0x88,0x87,0x87,0x78,0x78,0x77,0x77,0x87,0x87,0x78,0x78,0x78,0x77,0x77,0x88,0x87,0x78,0x77,0x77,0x70,0x70,0x77,0x70,0x00,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF8,0x77,0x78,0x78,0x77,0x78,0x87,0x87,0x87,0x87,0x78,0x78,0x78,0x78,0x78,0x88,0x78,0x78,0x87,0x77,0x77,0x77,0x07,0x70,0x77,0x07,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF8,0x07,0x88,0x87,0x87,0x87,0x88,0x88,0x88,0x78,0x87,0x87,0x87,0x87,0x87,0x87,0x87,0x77,0x88,0x87,0x70,0x77,0x77,0x78,0x88,0x87,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0x78,0x77,0x88,0x78,0x78,0x78,0x88,0x88,0x88,0xF8,0xF8,0x88,0x88,0x77,0x78,0x78,0x87,0x78,0x87,0x77,0x07,0x77,0x88,0x77,0x77,0x07,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0x77,0x87,0x87,0x87,0x87,0x87,0x78,0x88,0x77,0x77,0x77,0x88,0x77,0x87,0x78,0x77,0x88,0x88,0x88,0x77,0x77,0x78,0x87,0x77,0x88,0x77,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xF7,0x77,0x77,0x87,0x77,0x77,0x07,0x00,0x70,0x07,0x07,0x07,0x70,0x77,0x77,0x77,0x77,0x77,0x87,0x88,0x88,0x78,0x87,0x77,0x07,0x77,0x78,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0x87,0x00,0x70,0x77,0x77,0x77,0x07,0x07,0x07,0x00,0x70,0x70,0x70,0x07,0x07,0x77,0x77,0x87,0x78,0x78,0x88,0x78,0x88,0x70,0x70,0x77,0x7F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0x80,0x07,0x00,0x07,0x77,0x77,0x70,0x00,0x70,0x77,0x07,0x07,0x70,0x77,0x77,0x78,0x77,0x77,0x87,0x87,0x88,0x88,0x87,0x77,0x70,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xF8,0x07,0x00,0x00,0x78,0x87,0x77,0x77,0x07,0x07,0x77,0x77,0x77,0x77,0x88,0x87,0x87,0x87,0x78,0x78,0x88,0x88,0x77,0x78,0x87,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0x07,0x77,0x07,0x88,0x87,0x77,0x77,0x70,0x77,0x07,0x77,0x78,0x88,0x88,0x88,0x78,0x78,0x78,0x88,0x78,0x88,0x78,0xF8,0x87,0xFF,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0x70,0x77,0x77,0xF8,0x88,0x87,0x88,0x87,0x77,0x77,0x77,0x87,0x88,0x78,0x77,0x87,0x87,0x87,0x87,0x87,0x88,0x88,0x88,0x77,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xF8,0x77,0x77,0x78,0xFF,0x87,0x78,0x77,0x78,0x88,0x88,0x88,0x78,0x87,0x87,0x77,0x77,0x87,0x78,0x77,0x87,0x88,0x77,0x77,0x77,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0x77,0x78,0x8F,0xF8,0x88,0x88,0x77,0x70,0x78,0x87,0x87,0x88,0x78,0x77,0x77,0x78,0x78,0x78,0x87,0x87,0x88,0x80,0x77,0x78,0x8F,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0x77,0x77,0x87,0x88,0x87,0x88,0x87,0x77,0x07,0x77,0x77,0x77,0x77,0x87,0x78,0x77,0x87,0x87,0x87,0x87,0x88,0x88,0x78,0xF7,0x77,0xFF,0xFF,0xFF
        db 0xFF,0xFF,0xFF,0xFF,0x77,0x07,0x77,0x07,0x07,0x07,0x07,0x07,0x77,0x70,0x77,0x78,0x77,0x77,0x77,0x78,0x77,0x87,0x87,0x77,0x88,0x78,0xF8,0x70,0x00,0x07,0x77,0x7F
        db 0xFF,0xFF,0xFF,0xFF,0xF7,0x70,0x77,0x70,0x70,0x77,0x77,0x77,0x88,0x77,0x77,0x77,0x77,0x77,0x77,0x77,0x78,0x78,0x78,0x78,0x77,0x8F,0x70,0x00,0x70,0x70,0x00,0x70
        db 0xFF,0xFF,0xFF,0xFF,0xF8,0x77,0x77,0x77,0x77,0x77,0x77,0x87,0x87,0x77,0x77,0x77,0x77,0x77,0x77,0x87,0x77,0x77,0x77,0x77,0x88,0x77,0x00,0x70,0x70,0x70,0x70,0x70
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xF7,0x77,0x77,0x07,0x07,0x07,0x07,0x00,0x70,0x77,0x77,0x77,0x77,0x77,0x77,0x77,0x77,0x77,0x87,0x77,0x00,0x70,0x70,0x07,0x07,0x07,0x07
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x87,0x07,0x77,0x77,0x77,0x77,0x77,0x77,0x70,0x77,0x77,0x77,0x77,0x77,0x77,0x77,0x77,0x70,0x00,0x07,0x00,0x07,0x07,0x07,0x07,0x00
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0x87,0x87,0x77,0x77,0x77,0x78,0x87,0x77,0x70,0x77,0x77,0x77,0x77,0x77,0x77,0x70,0x00,0x70,0x00,0x77,0x07,0x07,0x07,0x07,0x70
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0x77,0x77,0x77,0x77,0x77,0x88,0x77,0x77,0x77,0x77,0x77,0x70,0x70,0x00,0x00,0x07,0x07,0x07,0x00,0x70,0x70,0x70,0x70,0x00
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x88,0x77,0x77,0x88,0x88,0x77,0x77,0x77,0x77,0x77,0x70,0x70,0x70,0x00,0x07,0x00,0x00,0x70,0x77,0x07,0x00,0x00,0x07,0x70
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0x88,0x88,0x78,0x78,0x77,0x77,0x77,0x70,0x70,0x00,0x00,0x00,0x70,0x00,0x70,0x70,0x70,0x00,0x00,0x70,0x77,0x07,0x07
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x87,0x77,0x77,0x70,0x70,0x70,0x70,0x07,0x07,0x00,0x70,0x00,0x07,0x00,0x70,0x70,0x07,0x07,0x00,0x70,0x07,0x07,0x70
        db 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,0x87,0x70,0x70,0x77,0x70,0x07,0x00,0x00,0x00,0x00,0x07,0x00,0x70,0x07,0x00,0x70,0x00,0x70,0x70,0x77,0x70,0x77

