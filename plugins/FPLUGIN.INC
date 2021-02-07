;[]=======================================================================[]
; Sprinter constants

BORDER		equ	0xFE
YPORT		equ	0x89
PAGE0		equ	0x82
PAGE1		equ	0xA2
PAGE2		equ	0xC2
PAGE3		equ	0xE2

;[]=======================================================================[]
; Flex Navigator constants

PluginOrg	equ	0xC000

; Flex Navigator working buffers
WorkBuffer	equ	0x8000
PagesList	equ	0x8400
; Flex Navigator API functions
ClearScreen	equ	0x8603
MakeWindow	equ	0x8606
InvertRectan	equ	0x8609
PrnTxtLnIFF	equ	0x860C
PrnTxtLnNorm	equ	0x860F
PrnTxtLnNormC	equ	0x8612
PrnRangPathL	equ	0x8615
PrnRangPathR	equ	0x8618
PrnRangPathC	equ	0x861B
InputLine	equ	0x861E
InpLnExtN	equ	0x8621
InpLnExtC	equ	0x8624

InitScrBar	equ	0x862A
PrnHScrBar	equ	0x862D
PrnVScrBar	equ	0x8630
InitProcess	equ	0x8633
PrnProcess	equ	0x8636

ResFire		equ	0x8648
TestCoords	equ	0x864B
SetCMOSPrint	equ	0x864E
ResCMOSPrint	equ	0x8651
SetClock	equ	0x8654
SetMouse	equ	0x8657

MoveBytes	equ	0x8669
MoveBytesUp	equ	0x866C
Mult8		equ	0x866F
Mult16X8	equ	0x8672
Mult16		equ	0x8675
Mult16X16	equ	0x8678
Mult32		equ	0x867B
Divis16X16	equ	0x867E
Divis24X16	equ	0x8681
Divis32X16	equ	0x8684
Divis32		equ	0x8687
ConvNumTxt32	equ	0x868A
ConvNumTxt16	equ	0x868D
ConvNumTxt8	equ	0x8690
ConvTxtNum32	equ	0x8693
ConvTxtNum16	equ	0x8696

DOSError	equ	0x86A8


