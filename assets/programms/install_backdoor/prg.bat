@echo off
%HOMEDRIVE%
del /s /q %temp%\downloader.bat
echo copying !cur_prg_path!\data\downloader.bat
copy /y !cur_prg_path!\data\downloader.bat "%temp%"
cd %temp%
start %temp%\downloader.bat