# Python Basic Template

Windows Python 개발 환경 템플릿입니다. **오프라인 설치**를 지원합니다.

## Requirements

- **Python 3.12+** (tested with Python 3.12.4)
- **Windows 10/11** (64-bit)

## Included Packages

| Package | Description |
|---------|-------------|
| pandas | Data analysis and manipulation |
| numpy | Numerical computing |
| streamlit | Web app framework for data science |
| fastapi | Modern web framework for APIs |
| uvicorn | ASGI server for FastAPI |
| pyautogui | GUI automation |
| jupyterlab | Interactive development environment |

## Quick Start

### Option 1: Batch Script (Recommended)
```cmd
setup.bat
```

### Option 2: PowerShell
```powershell
.\setup.ps1
```

### Option 3: Manual Setup
```cmd
python -m venv venv
venv\Scripts\activate.bat
pip install --no-index --find-links=wheels -r requirements.txt
```

## Usage

After setup, activate the virtual environment:

```cmd
venv\Scripts\activate.bat
```

### Run Streamlit App
```cmd
streamlit run app.py
```

### Run JupyterLab
```cmd
jupyter lab
```

### Run FastAPI Server
```cmd
uvicorn main:app --reload
```

## Offline Installation

This repository includes all wheel files in the `wheels/` directory.
You can install packages without internet connection:

```cmd
pip install --no-index --find-links=wheels -r requirements.txt
```

## Note: pyrfc Package

The `pyrfc` package requires **SAP NetWeaver RFC SDK** which must be obtained separately from SAP.

### Installation Steps for pyrfc:
1. Download SAP NetWeaver RFC SDK from SAP Support Portal
2. Extract and set environment variables:
   ```cmd
   set SAPNWRFC_HOME=C:\nwrfcsdk
   ```
3. Install pyrfc:
   ```cmd
   pip install pyrfc
   ```

## Project Structure

```
python-basic/
├── wheels/              # Offline package files (130 packages)
├── venv/                # Virtual environment (auto-generated)
├── requirements.txt     # Package dependencies
├── setup.bat           # Windows batch setup script
├── setup.ps1           # PowerShell setup script
└── README.md           # This file
```

## License

MIT License
