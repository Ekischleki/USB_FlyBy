Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c soundup.bat"
oShell.Run strArgs, 0, false