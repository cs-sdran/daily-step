@echo off
setlocal
chcp 65001 >nul
cd /d "%~dp0.."

REM Create a project-local virtual environment.
if not exist ".venv\Scripts\python.exe" (
    where py >nul 2>&1
    if errorlevel 1 (
        python -m venv .venv
    ) else (
        py -3 -m venv .venv
    )
    if errorlevel 1 goto :failed
)

set "PYTHON=.venv\Scripts\python.exe"
"%PYTHON%" -m pip install -r requirements.txt
if errorlevel 1 goto :failed

REM The icon is optional.
if exist "src\app.ico" (
    "%PYTHON%" -m PyInstaller --noconfirm --clean --onefile --windowed --name "积跬步" --icon "src\app.ico" --add-data "src\index.html:." "src\main.py"
) else (
    "%PYTHON%" -m PyInstaller --noconfirm --clean --onefile --windowed --name "积跬步" --add-data "src\index.html:." "src\main.py"
)
if errorlevel 1 goto :failed

echo.
echo Build complete: dist\积跬步.exe
exit /b 0

:failed
echo Build failed. Check the messages above.
exit /b 1
