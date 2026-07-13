@echo off
setlocal
cd /d "%~dp0"

git status >nul 2>nul
if errorlevel 1 (
  echo Git repository is not initialized.
  pause
  exit /b 1
)

git add .
git commit -m "Update site"
if errorlevel 1 (
  echo No changes to commit or commit failed.
)

git push
if errorlevel 1 (
  echo.
  echo Push failed. Check that GitHub remote is connected.
  pause
  exit /b 1
)

echo.
echo Site update pushed. Netlify will deploy it automatically.
pause
