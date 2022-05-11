Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c rbomb.bat"
oShell.Run strArgs, 0, false