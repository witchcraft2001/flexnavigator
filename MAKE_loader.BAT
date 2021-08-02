rem echo OFF
echo Compiling all modules...
cd editor
call MAKE_feditor.bat
if errorlevel 1 goto ERR
cd ..\viewer
call MAKE_fviewer.bat
if errorlevel 1 goto ERR
cd ..
call MAKE_FN.bat
if errorlevel 1 goto ERR
echo Compressing modules...
rem del /Q bin\*.hst
rem tools\hrust.exe bin\fnmain.bin bin\fnmain.hst
rem tools\hrust.exe bin\fnfunc.bin bin\fnfunc.hst
rem tools\hrust.exe bin\fnview.bin bin\fnview.hst
rem tools\hrust.exe bin\fnedit.bin bin\fnedit.hst
rem tools\hrust.exe bin\fnhelp.bin bin\fnhelp.hst
rem tools\hrust.exe bin\fnfont.bin bin\fnfont.hst
echo Compiling loader, link all modules...
C:\asm\sjasm\sjasmplus.exe --lst=fnloader.lst --lstlab fnloader.z80
if errorlevel 1 goto ERR
copy /Y bin\fnloader.exe /B + bin\fnmain.bin /B + bin\fnfunc.bin /B + bin\fnview.bin /B + bin\fnedit.bin /B + bin\fnhelp.bin /B + bin\fnfont.bin /B fn.exe /B
if errorlevel 1 goto ERR
echo MAKE PLUGINS
cd plugins\test
call make_test.bat
cd ..\cdplayer
call make_cdp.bat
cd ..\flx_date
call make_date.bat
if errorlevel 1 goto ERR
cd ..\..
goto END
:ERR
rem pause
echo Compilation ERRORs!!!
pause 0
rem exit
:END
echo Done!
rem pause 0