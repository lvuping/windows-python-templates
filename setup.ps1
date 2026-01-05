# PowerShell Script for Offline Python Environment Setup
# Python 3.12+ required

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Python Virtual Environment Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "[INFO] Detected: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Python 3.12+ from https://www.python.org/downloads/" -ForegroundColor Yellow
    exit 1
}

# Create virtual environment if not exists
if (-not (Test-Path "venv")) {
    Write-Host "[INFO] Creating virtual environment..." -ForegroundColor Yellow
    python -m venv venv
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Failed to create virtual environment" -ForegroundColor Red
        exit 1
    }
    Write-Host "[OK] Virtual environment created" -ForegroundColor Green
} else {
    Write-Host "[INFO] Virtual environment already exists" -ForegroundColor Yellow
}

# Activate virtual environment
Write-Host "[INFO] Activating virtual environment..." -ForegroundColor Yellow
& .\venv\Scripts\Activate.ps1

# Install packages from local wheels
Write-Host "[INFO] Installing packages from local wheels (offline)..." -ForegroundColor Yellow
pip install --no-index --find-links=wheels -r requirements.txt

if ($LASTEXITCODE -ne 0) {
    Write-Host "[WARNING] Offline installation failed, trying online..." -ForegroundColor Yellow
    pip install -r requirements.txt
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To activate the virtual environment:" -ForegroundColor White
Write-Host "  .\venv\Scripts\Activate.ps1" -ForegroundColor Yellow
Write-Host ""
Write-Host "Available tools:" -ForegroundColor White
Write-Host "  - streamlit run app.py" -ForegroundColor Yellow
Write-Host "  - jupyter lab" -ForegroundColor Yellow
Write-Host "  - uvicorn main:app --reload" -ForegroundColor Yellow
