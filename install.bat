@echo off
setlocal enabledelayedexpansion

REM Function to check if a directory exists
:checkDirExists
if exist %1 (
    echo Directory %1 already exists. Skipping clone.
    set cloneRequired=false
) else (
    set cloneRequired=true
)
goto :eof

REM Function to check the last command and exit if it failed
:checkError
if %errorlevel% neq 0 (
    echo Error occurred. Exiting script.
    pause
    exit /b %errorlevel%
)
goto :eof

REM Clone and set up a repository
:setupRepo
call :checkDirExists %1
if "!cloneRequired!"=="true" (
    echo Cloning the %2 repository...
    git clone %3
    timeout /t 1
    call :checkError
)

echo Navigating into the %2 repository folder...
cd %1
timeout /t 1
call :checkError

echo %4
%5
timeout /t 1
call :checkError

echo Navigating back to the main folder...
cd ..
timeout /t 1
call :checkError

goto :eof

REM Start of the script

timeout /t 1

REM Setup BACKEND repository
call :setupRepo managements "BACKEND" "https://github.com/KAZTorant/managements.git" "Creating a virtual environment..." "python -m venv venv"
echo Activating the virtual environment...
call managements\venv\Scripts\activate
timeout /t 1
call :checkError
echo Installing Python dependencies...
pip install -r managements\requirements.txt
timeout /t 1
call :checkError
echo Deactivating the virtual environment...
deactivate
timeout /t 1
call :checkError

REM Setup FRONTEND repository
call :setupRepo frontend "FRONTEND" "https://github.com/KAZTorant/frontend.git" "Installing npm dependencies..." "npm install"
timeout /t 3
call :checkError

REM Setup PRINTER repository
call :setupRepo printer-v2 "PRINTER" "https://github.com/KAZTorant/printer-v2.git" "Installing npm dependencies..." "npm install"
timeout /t 3
call :checkError

REM Close the terminal
echo Installation process completed. Press any key to close the terminal...
pause
exit /b 0
