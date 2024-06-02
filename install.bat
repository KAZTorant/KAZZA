@echo off

REM Function to check if a directory exists
:checkDirExists
if exist %1 (
    echo Directory %1 already exists. Skipping clone.
    set cloneRequired=false
) else (
    set cloneRequired=true
)

REM Function to check the last command and exit if it failed
:checkError
if %errorlevel% neq 0 (
    echo Error occurred. Exiting script.
    exit /b %errorlevel%
)

REM Clone the BACKEND repository
call :checkDirExists managements
if %cloneRequired%==true (
    echo Cloning the BACKEND repository...
    git clone https://github.com/KAZTorant/managements.git
    timeout /t 1
    call :checkError
)

REM Navigate into the cloned repository folder
echo Navigating into the BACKEND repository folder...
cd managements
timeout /t 1
call :checkError

REM Create a virtual environment
echo Creating a virtual environment...
python -m venv venv
timeout /t 1
call :checkError

REM Activate the virtual environment
echo Activating the virtual environment...
call venv\Scripts\activate
timeout /t 1
call :checkError

REM Install requirements
echo Installing Python dependencies...
pip install -r requirements.txt
timeout /t 1
call :checkError

REM Going back to home
echo Navigating back to the main folder...
cd ..
timeout /t 1
call :checkError

REM Clone the FRONTEND repository
call :checkDirExists frontend
if %cloneRequired%==true (
    echo Cloning the FRONTEND repository...
    git clone https://github.com/KAZTorant/frontend.git
    timeout /t 1
    call :checkError
)

REM Navigate into the cloned repository folder
echo Navigating into the FRONTEND repository folder...
cd frontend
timeout /t 1
call :checkError

REM Install npm dependencies
echo Installing npm dependencies for FRONTEND...
npm install
timeout /t 3
call :checkError

REM Going back to home
echo Navigating back to the main folder...
cd ..
timeout /t 3
call :checkError

REM Clone the PRINTER repository
call :checkDirExists printer-v2
if %cloneRequired%==true (
    echo Cloning the PRINTER repository...
    git clone https://github.com/KAZTorant/printer-v2.git
    timeout /t 3
    call :checkError
)

REM Navigate into the cloned repository folder
echo Navigating into the PRINTER repository folder...
cd printer-v2
timeout /t 3
call :checkError

REM Install npm dependencies
echo Installing npm dependencies for PRINTER...
npm install
timeout /t 3
call :checkError

REM Going back to home
echo Navigating back to the main folder...
cd ..
timeout /t 3
call :checkError

REM Close the terminal
echo Installation process completed. Closing the terminal...
timeout /t 3
exit /b 0
