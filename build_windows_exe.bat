@echo off
setlocal

echo ============================================================
echo Smart Workflow Automator v4 - One EXE Builder
echo ============================================================

where python >nul 2>nul
if errorlevel 1 (
    echo Python was not found.
    echo Install Python 3.10+ first.
    pause
    exit /b 1
)

python -m venv .build_env
if errorlevel 1 (
    echo Failed to create build environment.
    pause
    exit /b 1
)

call .build_env\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt

pyinstaller --clean --noconfirm smart_workflow_automator.spec

if exist dist\SmartWorkflowAutomator.exe (
    echo.
    echo SUCCESS.
    echo Main app:
    echo dist\SmartWorkflowAutomator.exe
    echo.
    echo Chrome extension folder is bundled into the EXE and also available here:
    echo chrome_helper_extension
) else (
    echo Build finished but EXE was not found. Check errors above.
)

pause
endlocal
