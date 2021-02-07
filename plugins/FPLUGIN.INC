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
_FN_API_8600	equ	0x8600
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
_FN_API_8627	equ	0x8627
InitScrBar	equ	0x862A
PrnHScrBar	equ	0x862D
PrnVScrBar	equ	0x8630
InitProcess	equ	0x8633
PrnProcess	equ	0x8636
_FN_API_8639	equ	0x8639
_FN_API_863C	equ	0x863C
_FN_API_863F	equ	0x863F
_FN_API_8642	equ	0x8642
_FN_API_8645	equ	0x8645
ResFire		equ	0x8648
TestCoords	equ	0x864B
SetCMOSPrint	equ	0x864E
ResCMOSPrint	equ	0x8651
SetClock	equ	0x8654
SetMouse	equ	0x8657
_FN_API_865A	equ	0x865A
_FN_API_865D	equ	0x865D
_FN_API_8660	equ	0x8660
_FN_API_8663	equ	0x8663
_FN_API_8666	equ	0x8666
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
_FN_API_8699	equ	0x8699
_FN_API_869C	equ	0x869C
_FN_API_869F	equ	0x869F
_FN_API_86A2	equ	0x86A2
_FN_API_86A5	equ	0x86A5
DOSError	equ	0x86A8


