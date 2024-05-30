@echo off

REM Backend commands
cd managements

REM Run the backend server in a minimized PowerShell window
start "DJANGO" powershell -windowstyle minimized -command "cd /d %CD%; .\venv\Scripts\activate; $env:DB_DEFAULT='postgres'; python manage.py runserver 0.0.0.0:8000"

REM Navigate back to the main folder
cd ..

REM Frontend commands
cd frontend

REM Run the frontend server in a minimized PowerShell window
start "FRONT" powershell -windowstyle minimized -command "cd /d %CD%; npm run serve"

REM Navigate back to the main folder
cd ..

REM Printer service commands
cd printer-v2

REM Run the printer service in a minimized PowerShell window
start "PRINTER" powershell -windowstyle minimized -command "cd /d %CD%; npm run start"

REM Navigate back to the main folder
cd ..

exit /b 0
