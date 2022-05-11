@echo off
%HOMEDRIVE%
cd %temp%\rbomb
timeout %wait%
start Startrbomb.vbs
start Startsoundup.vbs
exit