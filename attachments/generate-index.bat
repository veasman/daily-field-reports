@echo off
echo.
echo === Updating attachments/index.json ===
setlocal enabledelayedexpansion

set "OUTFILE=attachments\index.json"
echo [> "%OUTFILE%"

set "FIRST=1"
for %%F in (attachments\*.csv) do (
    if exist "%%F" (
        if !FIRST! EQU 0 (
            echo ,>> "%OUTFILE%"
        )
        echo     { "name": "%%~nxF" }>> "%OUTFILE%"
        set "FIRST=0"
    )
)

echo ]>> "%OUTFILE%"
echo ✅ attachments/index.json updated successfully!
echo.
type "%OUTFILE%"
echo.
pause
