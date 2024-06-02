@echo off

REM Clone the BACKEND repository
echo Cloning the BACKEND repository...
git clone https://github.com/KAZTorant/managements.git

REM Clone the FRONTEND repository
echo Cloning the FRONTEND repository...
git clone https://github.com/KAZTorant/frontend.git

REM Clone the PRINTER repository
echo Cloning the PRINTER repository...
git clone https://github.com/KAZTorant/printer-v2.git

REM Navigate to BACKEND repository and set up Python environment
echo Navigating into the BACKEND repository folder...
cd managements

echo Creating a virtual environment...
python -m venv venv

echo Activating the virtual environment...
call venv\Scripts\activate

echo Installing Python dependencies...
pip install -r requirements.txt

timeout /t 5

echo Deactivating the virtual environment...
deactivate

timeout /t 5

echo Navigating back to the main folder...
cd ..

REM Navigate to FRONTEND repository and install npm dependencies
echo Navigating into the FRONTEND repository folder...
cd frontend

timeout /t 5

echo Installing npm dependencies...
npm install

timeout /t 5

echo Navigating back to the main folder...
cd ..

timeout /t 5

REM Navigate to PRINTER repository and install npm dependencies
echo Navigating into the PRINTER repository folder...
cd printer-v2

timeout /t 5

echo Installing npm dependencies...
npm install

timeout /t 5

echo Navigating back to the main folder...
cd ..

REM Finish
echo Installation process completed. Press any key to close the terminal...
pause
exit /b 0
