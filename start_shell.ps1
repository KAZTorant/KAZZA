Start-Process -FilePath "cmd.exe" -ArgumentList "/c cd managements && call .\venv\Scripts\activate && set DB_DEFAULT=postgres && python manage.py runserver 0.0.0.0:8000" -WindowStyle Hidden
Start-Process -FilePath "cmd.exe" -ArgumentList "/c cd frontend && npm run serve" -WindowStyle Hidden
Start-Process -FilePath "cmd.exe" -ArgumentList "/c cd printer-v2 && npm run start" -WindowStyle Hidden
