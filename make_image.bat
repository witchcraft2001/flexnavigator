rem echo OFF
mkdir build
echo Unmounting old image ...
osfmount.com -D -m X:

echo Assembling ...
call make_loader.bat
if errorlevel 1 goto ERR

echo Preparing floppy disk image ...
copy /Y image\dss_image.img build\fn.img
rem Delay before copy image
timeout 2 > nul
osfmount.com -a -t file -o rw -f build/fn.img -m X:
if errorlevel 1 goto ERR
mkdir X:\FN\PLUGINGS
mkdir X:\FN\EXAMPLES
copy /Y fn.exe /B X:\FN\ /B
copy /Y bin\plugins\*.* /B X:\FN\PLUGINGS\ /B
copy /Y examples\*.* /B X:\FN\EXAMPLES\ /B
rem copy /Y gifview.txt /A X:\GIFVIEW\ /A
if errorlevel 1 goto ERR
echo Unmounting image ...
osfmount.com -d -m X:
rem Delay before copy image
timeout 2 > nul
goto SUCCESS
:ERR
rem pause
echo Some Building ERRORs!!!
pause 0
rem exit
goto END
:SUCCESS
echo Copying image to ZXMAK2 Emulator
copy /Y build\fn.img /B %SPRINTER_EMULATOR% /B
rem "%PROGRAMFILES%\7-Zip\7z.exe" a build\fn.zip fn.exe fn.txt
rem timeout 2 > nul
rem echo Starting ZXMAK2 Emulator
rem call %SPRINTER_EMULATOR%\ZXMAK2.EXE build\fn.img
echo Done!
:END
pause 0