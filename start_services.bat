@echo off
setlocal enabledelayedexpansion

REM Function to report error and continue
:reportError
    echo Error occurred: !errormessage!
    set errorcode=%ERRORLEVEL%

REM Backend commands
cd managements

REM Check if venv directory exists
if not exist venv (
    echo Creating virtual environment...
    python -m venv venv
)

REM Run the backend server in a new command window
start /b cmd /c "cd /d %CD% && call .\venv\Scripts\activate && pip install -r requirements.txt && set DB_DEFAULT=postgres && python manage.py runserver 0.0.0.0:8000 > backend_log.txt 2>&1 && echo Backend completed && start http://localhost:8000"

REM Navigate back to the main folder
cd ..

REM Frontend commands
cd frontend

start /b cmd /c "cd /d %CD% && npm install && npm run serve > frontend_log.txt 2>&1 && echo Frontend completed && start http://localhost:8080"

REM Navigate back to the main folder
cd ..

REM Printer service commands
cd printer-v2

start /b cmd /c "cd /d %CD% && npm install && npm run start > printer_log.txt 2>&1"

REM Navigate back to the main folder
cd ..

pause
exit /b 0
