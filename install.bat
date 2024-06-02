@echo off

REM Function to check if a directory exists
:checkDirExists
if exist %1 (
    echo Directory %1 already exists.
) else (
    echo Cloning %2 repository...
    git clone %3
)

REM Clone the BACKEND repository if it doesn't exist
call :checkDirExists managements "BACKEND" https://github.com/KAZTorant/managements.git

REM Navigate into the cloned repository folder
cd managements

REM Create a virtual environment
echo Creating virtual environment...
python -m venv venv

REM Activate the virtual environment
echo Activating virtual environment...
call venv\Scripts\activate

REM Install requirements
echo Installing Python dependencies...
pip install -r requirements.txt

REM Going back to home
cd ..

REM Clone the FRONTEND repository if it doesn't exist
call :checkDirExists frontend "FRONTEND" https://github.com/KAZTorant/frontend.git

REM Navigate into the cloned repository folder
cd frontend

REM Install npm dependencies
echo Installing npm dependencies for FRONTEND...
npm install

REM Going back to home
cd ..

REM Clone the PRINTER repository if it doesn't exist
call :checkDirExists printer-v2 "PRINTER" https://github.com/KAZTorant/printer-v2.git

REM Navigate into the cloned repository folder
cd printer-v2

REM Install npm dependencies
echo Installing npm dependencies for PRINTER...
npm install

REM Going back to home
cd ..

REM Close the terminal
echo Installation process completed.
exit
