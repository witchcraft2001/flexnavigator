                DEVICE ZXSPECTRUM128
                include "..\fplugin.inc"
                org 0BFF0h
PluginStart:
                db 'FLX-PLUG'
                dw 0
                dw PluginEntry
                db 0
                db 0
                db 0
                db 0
                db 'Date preferences plug-in for Flex Navigator',0
                db '2003 (c) Mac Buster',0
                db '$VER: 1.0 15-Jul-2003',0
; ---------------------------------------------------------------------------

PluginEntry:
                call    MakeWindow
; ---------------------------------------------------------------------------
                db 1
                dw 0098h, 0060h,    ;X, Y
                dw 0150h, 0042h    ;LEN, HGT
                db 2         ;head place
                dw 0004h, 0002h 
                dw 0148h, 000Ah
                db 0
                db 1         ;text line
                dw 0006h, 0003h
                db 0Fh
                db ' Date preferences v1.0',0
                db 6         ;отрисовка горизонтального разделителя
                dw 0001h, 000Dh
                dw 0150h
                db 6         ;отрисовка горизонтального разделителя
                dw 0011h, 001Ch
                dw 0130h
                db 6         ;отрисовка горизонтального разделителя
                dw 0011h, 002Eh
                dw 0130h
                db 1         ;text line
                dw 0012h, 0022h
                db 80h
aDay:           db 'Day',0
                db 3         ;отрисовка углублённой прямоугольной плоскости
                dw 0026h, 0021h
                dw 0038h, 000Ah
                db 0Bh          ;отрисовка нижней кнопки скролбара
                dw 003Ch, 0022h
                db 0Ah         ;отрисовка верхней кнопки скролбара
                dw 004Ch, 0022h
                db 1         ;text line
                dw 0064h, 0022h
                db 80h
aMonth:         db 'Month',0
                db 3            ;отрисовка углублённой прямоугольной плоскости
                dw 0085h, 0021h
                dw 005Ch, 000Ah
                db 0Bh         ;отрисовка нижней кнопки скролбара
                dw 000BFh, 0022h
                db 0Ah         ;отрисовка верхней кнопки скролбара
                dw 00CFh, 0022h
                db 1            ;text line
                dw 00E6h, 0022h
                db 80h
aYear:          db 'Year',0
                db 3            ;отрисовка углублённой прямоугольной плоскости
                dw 00FEh, 0021h
                dw 0040h, 000Ah
                db 0Bh         ;отрисовка нижней кнопки скролбара
                dw 0011Dh, 0022h
                db 0Ah         ;отрисовка верхней кнопки скролбара
                dw 0012Dh, 0022h
                db 5            ;отрисовка кнопки с текстом
                dw 0012h, 0033h
                dw 0040h, 000Bh
                db 80h
                db ' ',0
                db 5            ;отрисовка кнопки с текстом
                dw 0056h, 0033h
                dw 0040h, 000Bh
                db 80h
                db ' ',0
                db 5            ;отрисовка кнопки с текстом
                dw 00FEh, 0033h
                dw 0040h, 000Bh
                db 80h
                db ' ',0
                db 0
; ---------------------------------------------------------------------------
                ld      ix, 40h ; '@'
                ld      hl, aSet        ; "Set"
                ld      de, 0CAh
                ld      bc, 95h
                ld      a, 80h
                call    PrnRangPathC
                ld      hl, aReset      ; "Reset"
                ld      de, 10Eh
                ld      bc, 95h
                ld      a, 80h
                call    PrnRangPathC
                ld      hl, aQuit       ; "Quit"
                ld      de, 1B6h
                ld      bc, 95h
                ld      a, 80h
                call    PrnRangPathC
                call    GetSysTime
                call    InitDate
                ld      ix, 140h
                ld      hl, aToday      ; "Today:"
                ld      de, 140h
                ld      bc, 72h ; 'r'
                ld      a, 80h
                call    PrnRangPathC
                call    sub_C2B7
                call    PrintMonth
                call    PrintYear
                call    ResFire
_plugin_loop:
                ld      ix, PluginMouseTab
                call    TestCoords
                halt
                ld      c, 31h ; '1'
                rst     10h
                jr      z, _plugin_loop
                ld      a, b
                or      a
                jr      nz, _plugin_loop
                ld      a, e
                cp      1Bh
                jr      nz, _plugin_loop

PluginExit:
                call    MakeWindow
                db 7Fh 
                db 0
                and     a
                ret
; ---------------------------------------------------------------------------
IncDay:
                ld      a, (byte_C400)
                ld      b, a
                ld      a, (Day)
                cp      b
                jr      nz, loc_C198
                ld      a, 0

loc_C198:
                inc     a
                ld      (Day), a

; =============== S U B R O U T I N E =======================================
PrintDay:
                ld      a, (Day)
                ld      l, a
                ld      h, 0
                add     hl, hl
                add     hl, hl
                ld      de, Days0
                add     hl, de
                ld      ix, 14h
                ld      de, 0C3h
                ld      bc, 82h
                ld      a, 80h
                call    PrnRangPathL
                ret
; End of function PrintDay

; ---------------------------------------------------------------------------

DecDay:
                ld      a, (byte_C400)
                ld      b, a
                ld      a, (Day)
                cp      1
                jr      nz, loc_C1C5
                ld      a, b
                inc     a

loc_C1C5:
                dec     a
                ld      (Day), a
                jr      PrintDay
; ---------------------------------------------------------------------------

IncMonth:
                ld      a, (Month)
                or      a
                ret     z
                dec     a
                ld      (Month), a
                call    sub_C268
                call    sub_C2B7

; =============== S U B R O U T I N E =======================================
PrintMonth:
                ld      hl, asc_C374
                call    sub_C1F3
                ld      a, (Month)
                ld      c, a
                ld      b, 0FFh
                ld      hl,  asc_C374+0Dh ; ""

loc_C1E9:
                ld      a, (hl)
                inc     hl
                or      a
                jr      nz, loc_C1E9
                inc     b
                ld      a, c
                cp      b
                jr      nz, loc_C1E9
; End of function PrintMonth


; =============== S U B R O U T I N E =======================================
sub_C1F3:
                ld      ix, 40h ; '@'
                ld      de, 13Ah
                ld      bc, 82h
                ld      a, 80h
                call    PrnRangPathC
                ret
; End of function sub_C1F3

; ---------------------------------------------------------------------------

DecMonth:
                ld      a, (Month)
                cp      0Bh
                ret     z
                inc     a
                ld      (Month), a
                call    sub_C268
                call    sub_C2B7
                jr      PrintMonth
; ---------------------------------------------------------------------------

IncYear:
                ld      hl,  a0+4       ; " "
                ld      c, 30h ; '0'
                ld      a, 39h ; '9'
                cp      (hl)
                jr      nz, loc_C230
                ld      (hl), c
                dec     hl
                cp      (hl)
                jr      nz, loc_C230
                ld      (hl), c
                dec     hl
                cp      (hl)
                jr      nz, loc_C230
                ld      (hl), c
                dec     hl
                cp      (hl)
                jr      nz, loc_C230
                ld      (hl), c
                dec     (hl)

loc_C230:
                inc     (hl)

; =============== S U B R O U T I N E =======================================
PrintYear:
                ld      ix, 1Ah
                ld      hl,  a0+1       ; "    "
                ld      de, 1A7h
                ld      bc, 82h
                ld      a, 80h
                call    PrnRangPathC
                call    sub_C268
                call    sub_C2B7
                ret
; End of function PrintYear

; ---------------------------------------------------------------------------

DecYear:
                ld      hl,  a0+4       ; " "
                ld      c, 39h ; '9'
                ld      a, 30h ; '0'
                cp      (hl)
                jr      nz, loc_C265
                ld      (hl), c
                dec     hl
                cp      (hl)
                jr      nz, loc_C265
                ld      (hl), c
                dec     hl
                cp      (hl)
                jr      nz, loc_C265
                ld      (hl), c
                dec     hl
                cp      (hl)
                jr      nz, loc_C265
                ld      (hl), c
                inc     (hl)
loc_C265:
                dec     (hl)
                jr      PrintYear

; =============== S U B R O U T I N E =======================================


sub_C268:
                ld      a, (Month)
                cp      1
                jr      z, loc_C285
                cp      3
                jr      z, loc_C27F
                cp      5
                jr      z, loc_C27F
                cp      0Ah
                jr      z, loc_C27F
                ld      a, 1Fh
                jr      loc_C281
; ---------------------------------------------------------------------------
loc_C27F:
                ld      a, 1Eh
loc_C281:
                ld      (byte_C400), a
                ret
; ---------------------------------------------------------------------------
loc_C285:
                ld      de,  a0+1       ; "    "
                call    ConvTxtNum16
                push    hl
                pop     bc
                ld      de, 190h
                push    bc
                call    Divis16X16
                pop     bc
                ld      a, h
                or      l
                jr      z, loc_C2AF
                ld      de, 4
                push    bc
                call    Divis16X16
                pop     bc
                ld      a, h
                or      l
                jr      nz, loc_C2B3
                ld      de, 64h ; 'd'
                call    Divis16X16
                ld      a, h
                or      l
                jr      z, loc_C2B3
loc_C2AF:
                ld      a, 1Dh
                jr      loc_C281
; ---------------------------------------------------------------------------

loc_C2B3:
                ld      a, 1Ch
                jr      loc_C281
; End of function sub_C268

; =============== S U B R O U T I N E =======================================
sub_C2B7:
                ld      a, (Day)
                ld      b, a
                ld      a, (byte_C400)
                cp      b
                jr      nc, loc_C2C4
                ld      (Day), a
loc_C2C4:
                call    PrintDay
                ret
; End of function sub_C2B7

; ---------------------------------------------------------------------------

SetDate:
                ld      de,  a0+1       ; "    "
                call    ConvTxtNum16
                push    hl
                ld      bc, 21h ; '!'
                rst     10h
                ld      a, (Day)
                ld      d, a
                ld      a, (Month)
                inc     a
                ld      e, a
                pop     ix
                ld      c, 22h ; '"'
                rst     10h
                call    InitDate
                jr      loc_C2E9
; ---------------------------------------------------------------------------

ReadDate:
                call    GetSysTime

loc_C2E9:
                call    PrintDay
                call    PrintMonth
                call    PrintYear
                ret

; =============== S U B R O U T I N E =======================================


GetSysTime:
                ld      bc, 21h ; '!'
                rst     10h
                ld      a, d
                ld      (Day), a
                ld      a, e
                dec     a
                ld      (Month), a
                push    ix
                ld      hl, a0          ; "0    "
                ld      b, 5

loc_C307:
                ld      (hl), 30h ; '0'
                inc     hl
                djnz    loc_C307
                pop     hl
                ld      de,  a0+1       ; "    "
                call    ConvNumTxt16
; End of function GetSysTime

; =============== S U B R O U T I N E =======================================

InitDate:
                ld      hl,  aToday+6   ; ""
                ld      b, 20h ; ' '
loc_C318:
                ld      (hl), 0
                inc     hl
                djnz    loc_C318
                ld      a, (Day)
                ld      l, a
                ld      h, 0
                add     hl, hl
                add     hl, hl
                ld      de, Days0
                add     hl, de
                ld      de,  aToday+6   ; ""
                ldi
                ldi
                ldi
                ex      de, hl
                ld      (hl), 20h ; ' '
                inc     hl
                push    hl
                ld      a, (Month)
                ld      c, a
                ld      b, 0FFh
                ld      hl,  asc_C374+0Dh ; ""

loc_C340:
                ld      a, (hl)
                inc     hl
                or      a
                jr      nz, loc_C340
                inc     b
                ld      a, c
                cp      b
                jr      nz, loc_C340
                pop     de

loc_C34B:
                ld      a, (hl)
                or      a
                jr      z, loc_C354
                ld      (de), a
                inc     hl
                inc     de
                jr      loc_C34B
; ---------------------------------------------------------------------------
loc_C354:
                ex      de, hl
                ld      (hl), 20h ; ' '
                inc     hl
                ex      de, hl
                ld      hl,  a0+1       ; "    "
                ldi
                ldi
                ldi
                ldi
                ret
; End of function InitDate

; ---------------------------------------------------------------------------
aSet:           db 'Set',0
aReset:         db 'Reset',0
aQuit:          db 'Quit',0
asc_C374:       db '             ',0
aJanuary:       db 'January',0
aFebruary:      db 'February',0
aMarch:         db 'March',0
aApril:         db 'April',0
aMay:           db 'May',0
aJune:          db 'June',0
aJuly:          db 'July',0
aAugust:        db 'August',0
aSeptember:     db 'September',0
aOctober:       db 'October',0
aNovember:      db 'November',0
aDecember:      db 'December',0
aToday:         db 'Today:',0
                ds 31, 0
Day:            db 12h
Month:          db 5
byte_C400:      db 1Eh
a0:             db '0    ',0
Days0:          ds 4, 0         ;Лишние 4 нуля, чтоб не отнимать 1 от номера дня
Days:           db ' 01',0
                db ' 02',0
                db ' 03',0
                db ' 04',0
                db ' 05',0
                db ' 06',0
                db ' 07',0
                db ' 08',0
                db ' 09',0
                db ' 10',0
                db ' 11',0
                db ' 12',0
                db ' 13',0
                db ' 14',0
                db ' 15',0
                db ' 16',0
                db ' 17',0
                db ' 18',0
                db ' 19',0
                db ' 20',0
                db ' 21',0
                db ' 22',0
                db ' 23',0
                db ' 24',0
                db ' 25',0
                db ' 26',0
                db ' 27',0
                db ' 28',0
                db ' 29',0
                db ' 30',0
                db ' 31',0

PluginMouseTab: dw 00D4h, 00E4h, 0082h, 008Ah, 0001h, 0000h, DecDay, 0000h
                dw 00E4h, 00F4h, 0082h, 008Ah, 0001h, 0000h, IncDay, 0000h
                dw 0156h, 0166h, 0082h, 008Ah, 0001h, 0000h, DecMonth, 0000h
                dw 0166h, 0176h, 0082h, 008Ah, 0001h, 0000h, IncMonth, 0000h
                dw 01B5h, 01C5h, 0082h, 008Ah, 0001h, 0000h, DecYear, 0000h
                dw 01C5h, 01D5h, 0082h, 008Ah, 0001h, 0000h, IncYear, 0000h
                dw 00EEh, 012Eh, 0093h, 009Eh, 0001h, 0000h, ReadDate, 0000h
                dw 00AAh, 00EAh, 0093h, 009Eh, 0001h, 0000h, SetDate, 0000h
                dw 0196h, 01D6h, 0093h, 009Eh, 0021h, 0000h, PluginExit, 0000h
                dw 8000h
PluginEnd:
                savebin	"flx-date.flx",PluginStart,PluginEnd-PluginStart