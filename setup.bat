@echo off
REM Windows Batch Script for Offline Python Environment Setup
REM Python 3.12+ required

echo ========================================
echo Python Virtual Environment Setup
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python 3.12+ from https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Check Python version
for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYVER=%%i
echo [INFO] Detected Python version: %PYVER%

REM Create virtual environment if not exists
if not exist "venv" (
    echo [INFO] Creating virtual environment...
    python -m venv venv
    if errorlevel 1 (
        echo [ERROR] Failed to create virtual environment
        pause
        exit /b 1
    )
    echo [OK] Virtual environment created
) else (
    echo [INFO] Virtual environment already exists
)

REM Activate virtual environment and install packages
echo [INFO] Installing packages from local wheels (offline)...
call venv\Scripts\activate.bat

pip install --no-index --find-links=wheels -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Package installation failed
    echo [INFO] Trying online installation as fallback...
    pip install -r requirements.txt
)

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo To activate the virtual environment:
echo   venv\Scripts\activate.bat
echo.
echo Available tools:
echo   - streamlit run app.py
echo   - jupyter lab
echo   - uvicorn main:app --reload
echo.
pause
