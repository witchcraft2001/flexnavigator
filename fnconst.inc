;[]----------------------------------------------------------[]
BORDER	EQU	#FE
YPORT	EQU	#89
PAGE0	EQU	#82
PAGE1	EQU	#A2
PAGE2	EQU	#C2
PAGE3	EQU	#E2
COUNT	EQU	#00
;[]----------------------------------------------------------[]
PanelCol EQU	#09
FileCol	 EQU	#0A
SFileCol EQU	#0B
InvSCol	 EQU	#0C
InvPCol	 EQU	#05
InvICol	 EQU	#06
;[]----------------------------------------------------------[]
PanelFlg EQU	+#00
ViewFlg	 EQU	+#01
SortFlg	 EQU	+#02
PanelXl	 EQU	+#03
PanelXh	 EQU	+#04
;[]----------------------------------------------------------[]
PanBarXl EQU	+#05
PanBarXh EQU	+#06
PanBarYl EQU	+#07
PanBarYh EQU	+#08
PanBrMLl EQU	+#09
PanBrMLh EQU	+#0A
PanBrLFl EQU	+#0D
PanBrLFh EQU	+#0E
PanBrRTl EQU	+#0F
PanBrRTh EQU	+#10
;[]----------------------------------------------------------[]
PanelFPl EQU	+#11
PanelFPh EQU	+#12
PanelEFl EQU	+#13
PanelEFh EQU	+#14
PanelFFl EQU	+#15
PanelFFh EQU	+#16
PanelCFl EQU	+#17
PanelCFh EQU	+#18
PanelMFl EQU	+#19
PanelMFh EQU	+#1A
PanelMBl1 EQU	+#1B
PanelMBh1 EQU	+#1C
PanelMBl2 EQU	+#1D
PanelMBh2 EQU	+#1E
BegPBar	EQU	+#05
BegMask	EQU	+#1F
BegPath	EQU	+#2C
;[]----------------------------------------------------------[]
BarXl	 EQU	+#00
BarXh	 EQU	+#01
BarYl	 EQU	+#02
BarYh	 EQU	+#03
BarMaxLl EQU	+#04
BarMaxLh EQU	+#05
BarLENl	 EQU	+#06
BarLENh	 EQU	+#07
BarLEFTl EQU	+#08
BarLEFTh EQU	+#09
BarRGHTl EQU	+#0A
BarRGHTh EQU	+#0B
BarPAGEl EQU	+#0C
BarPAGEh EQU	+#0D
BarMAXl	 EQU	+#0E
BarMAXh	 EQU	+#0F
BarFRSTl EQU	+#10
BarFRSTh EQU	+#11
;[]----------------------------------------------------------[]
ProcXl	  EQU	 +#00
ProcXh	  EQU	 +#01
ProcYl	  EQU	 +#02
ProcYh	  EQU	 +#03
ProcMaxLl EQU	 +#04
ProcMaxLh EQU	 +#05
ProcCOEFl EQU	 +#06
ProcCOEFh EQU	 +#07
ProcCORRl EQU	 +#08
ProcCORRh EQU	 +#09
ProcMAXl1 EQU	 +#0A
ProcMAXh1 EQU	 +#0B
ProcMAXl2 EQU	 +#0C
ProcMAXh2 EQU	 +#0D
ProcCURl1 EQU	 +#0E
ProcCURh1 EQU	 +#0F
ProcCURl2 EQU	 +#10
ProcCURh2 EQU	 +#11
ProcCOLOR EQU	 +#12
;[]----------------------------------------------------------[]

VERSION         EQU	#00
CHDISK	        EQU	#01
CURDISK	        EQU	#02
DSKINFO	        EQU	#03
G_ENTRY	        EQU	#04

BOOTDSK	        EQU	#09
CREATE	        EQU	#0A
CREAT_N	        EQU	#0B
ERASE	        EQU	#0D
DELETE	        EQU	#0E
MOVE	        EQU	#0F
RENAME	        EQU	#10
OPEN	        EQU	#11
CLOSE	        EQU	#12
READ	        EQU	#13
WRITE	        EQU	#14
MOVE_FP	        EQU	#15
ATTRIB	        EQU	#16
GET_D_T	        EQU	#17
PUT_D_T	        EQU	#18
F_FIRST	        EQU	#19
F_NEXT	        EQU	#1A
MKDIR	        EQU	#1B
RMDIR	        EQU	#1C
CHDIR	        EQU	#1D
CURDIR	        EQU	#1E
SYSTIME	        EQU	#21
SETTIME	        EQU	#22

WAITKEY	        EQU	#30
SCANKEY 	EQU	#31
ECHOKEY	        EQU	#32
CTRLKEY 	EQU	#33
EDIT	        EQU	#34
K_CLEAR 	EQU	#35

SETWIN	        EQU	#38
SETWIN1 	EQU	#39
SETWIN2	        EQU	#3A
SETWIN3 	EQU	#3B
FREEMEM	        EQU	#3C
GETMEM  	EQU	#3D
RETMEM	        EQU	#3E
SETMEM  	EQU	#3F

EXEC	        EQU	#40
EXIT    	EQU	#41
WAIT	        EQU	#42

GSWITCH 	EQU	#43
DOSNAME	        EQU	#44

SETVMOD 	EQU	#50
GETVMOD	        EQU	#51
LOCATE  	EQU	#52
CURSOR	        EQU	#53
SELPAGE 	EQU	#54
SCROLL	        EQU	#55
CLEAR   	EQU	#56
RDCHAR	        EQU	#57
WRCHAR  	EQU	#58
WINCOPY	        EQU	#59
WINREST 	EQU	#5A
PUTCHAR	        EQU	#5B
PCHARS  	EQU	#5C
RES_PRN        	EQU	#5D
CTRLPRN	        EQU	#5E
PRINT   	EQU	#5F


