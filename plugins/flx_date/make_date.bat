rem z80asm.exe -f bin test.z80 -o test.flx
mkdir ..\..\bin\plugins
C:\asm\sjasm\sjasmplus.exe --lst=flx-date.lst --lstlab flx-date.asm
copy /Y flx-date.flx /B ..\..\bin\plugins\flx-date.flx /B
