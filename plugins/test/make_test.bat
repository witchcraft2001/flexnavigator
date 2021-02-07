rem z80asm.exe -f bin test.z80 -o test.flx
mkdir ..\..\bin\plugins
C:\asm\sjasm\sjasmplus.exe --lst=test.lst --lstlab test.z80
copy /Y test.flx /B ..\..\bin\plugins\test.flx /B
