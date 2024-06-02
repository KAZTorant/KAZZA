@echo off

REM Navigate to the BACKEND directory
cd managements

REM Run the backend server in a minimized PowerShell window
start "DJANGO" powershell -windowstyle minimized -command "cd /d %CD%; .\venv\Scripts\activate; python manage.py migrate; Start-Process powershell -ArgumentList 'python manage.py runserver 0.0.0.0:8000' -NoNewWindow"

REM Navigate back to the main folder
cd ..

REM Navigate to the FRONTEND directory
cd frontend

REM Run the frontend server in a minimized PowerShell window
start "FRONT" powershell -windowstyle minimized -command "cd /d %CD%; Start-Process powershell -ArgumentList 'npm run serve' -NoNewWindow"

REM Navigate back to the main folder
cd ..

REM Navigate to the PRINTER directory
cd printer-v2

REM Run the printer service in a minimized PowerShell window
start "PRINTER" powershell -windowstyle minimized -command "cd /d %CD%; Start-Process powershell -ArgumentList 'npm start' -NoNewWindow"

REM Navigate back to the main folder
cd ..

REM Wait for a few seconds to ensure services are up
timeout /t 10 /nobreak

REM Open the front-end URL in the default web browser
start http://localhost:8080
start http://localhost:8000/admin

exit /b 0
