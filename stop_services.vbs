Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c stop_services.bat", 0, False
