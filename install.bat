@echo off

REM Clone the BACKEND repository
echo Cloning the BACKEND repository...
git clone https://github.com/KAZTorant/managements.git
timeout /t 1

REM Navigate into the cloned repository folder
echo Navigating into the BACKEND repository folder...
cd managements
timeout /t 1

REM Create a virtual environment
echo Creating a virtual environment...
python -m venv venv
timeout /t 1

REM Activate the virtual environment
echo Activating the virtual environment...
call venv\Scripts\activate
timeout /t 1

REM Install requirements
echo Installing Python dependencies...
pip install -r requirements.txt
timeout /t 1

REM Going back to home
echo Navigating back to the main folder...
cd ..
timeout /t 1

REM Clone the FRONTEND repository
echo Cloning the FRONTEND repository...
git clone https://github.com/KAZTorant/frontend.git
timeout /t 1

REM Navigate into the cloned repository folder
echo Navigating into the FRONTEND repository folder...
cd frontend
timeout /t 1

REM Install npm dependencies
echo Installing npm dependencies for FRONTEND...
npm install
timeout /t 3

REM Going back to home
echo Navigating back to the main folder...
cd ..
timeout /t 3

REM Clone the PRINTER repository
echo Cloning the PRINTER repository...
git clone https://github.com/KAZTorant/printer-v2.git
timeout /t 3

REM Navigate into the cloned repository folder
echo Navigating into the PRINTER repository folder...
cd printer-v2
timeout /t 3

REM Install npm dependencies
echo Installing npm dependencies for PRINTER...
npm install
timeout /t 3

REM Going back to home
echo Navigating back to the main folder...
cd ..
timeout /t 3

REM Close the terminal
echo Installation process completed. Closing the terminal...
timeout /t 3
exit
