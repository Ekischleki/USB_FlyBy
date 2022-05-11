Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c countdown.bat"
oShell.Run strArgs, 0, false