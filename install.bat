@echo off


REM Clone the BACKEND repository
git clone https://github.com/KAZTorant/managements.git

REM Navigate into the cloned repository folder
cd managements

REM Create a virtual environment
python -m venv venv

REM Activate the virtual environment
call venv\Scripts\activate

REM Install requirements
pip install -r requirements.txt


REM Going back to home
cd ..


REM Clone the FRONTEND repository
git clone https://github.com/KAZTorant/frontend.git

REM Navigate into the cloned repository folder
cd frontend

REM Install npm dependencies
npm install


REM Going back to home
cd ..


REM Clone the PRINTER repository
git clone https://github.com/KAZTorant/printer-v2.git

REM Navigate into the cloned repository folder
cd printer-v2

REM Install npm dependencies
npm install

REM Going back to home
cd ..


REM Close the terminal
exit