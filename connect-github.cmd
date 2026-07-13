@echo off
setlocal
cd /d "%~dp0"

echo Paste GitHub repository URL, for example:
echo https://github.com/username/altera-site.git
echo.
set /p REMOTE_URL=Repository URL: 

if "%REMOTE_URL%"=="" (
  echo Repository URL is empty.
  pause
  exit /b 1
)

git remote remove origin >nul 2>nul
git remote add origin "%REMOTE_URL%"
git push -u origin main

echo.
echo GitHub is connected. Netlify can now deploy from this repository.
pause
