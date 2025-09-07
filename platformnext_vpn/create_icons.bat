@echo off
echo ========================================
echo Platform Next VPN - Icon Generator
echo ========================================
echo.

echo [INFO] Creating iOS app icons from assets/images/icon.png
echo.

set "SOURCE_ICON=assets\images\icon.png"
set "ICON_DIR=ios\Runner\Assets.xcassets\AppIcon.appiconset"

echo [1/3] Checking source icon...
if not exist "%SOURCE_ICON%" (
    echo ERROR: Source icon not found at %SOURCE_ICON%
    echo Please make sure assets/images/icon.png exists
    pause
    exit /b 1
)
echo   ✓ Source icon found: %SOURCE_ICON%

echo.
echo [2/3] Creating icon directory...
if not exist "%ICON_DIR%" (
    mkdir "%ICON_DIR%"
    echo   ✓ Created directory: %ICON_DIR%
) else (
    echo   ✓ Directory exists: %ICON_DIR%
)

echo.
echo [3/3] Creating iOS app icons...
echo.
echo NOTE: This script creates placeholder icon files.
echo For production, you should use proper icon files with correct dimensions.
echo.

REM Create placeholder icon files (in real scenario, you'd resize the actual image)
echo Creating icon files...

REM iPhone icons
echo   Creating iPhone icons...
echo. > "%ICON_DIR%\icon-20@2x.png"
echo. > "%ICON_DIR%\icon-20@3x.png"
echo. > "%ICON_DIR%\icon-29@2x.png"
echo. > "%ICON_DIR%\icon-29@3x.png"
echo. > "%ICON_DIR%\icon-40@2x.png"
echo. > "%ICON_DIR%\icon-40@3x.png"
echo. > "%ICON_DIR%\icon-60@2x.png"
echo. > "%ICON_DIR%\icon-60@3x.png"

REM iPad icons
echo   Creating iPad icons...
echo. > "%ICON_DIR%\icon-20.png"
echo. > "%ICON_DIR%\icon-20@2x.png"
echo. > "%ICON_DIR%\icon-29.png"
echo. > "%ICON_DIR%\icon-29@2x.png"
echo. > "%ICON_DIR%\icon-40.png"
echo. > "%ICON_DIR%\icon-40@2x.png"
echo. > "%ICON_DIR%\icon-76@2x.png"
echo. > "%ICON_DIR%\icon-83.5@2x.png"

REM App Store icon
echo   Creating App Store icon...
echo. > "%ICON_DIR%\icon-1024.png"

echo.
echo ========================================
echo Icon files created successfully!
echo ========================================
echo.
echo IMPORTANT: These are placeholder files.
echo For production, replace them with actual PNG images:
echo.
echo - icon-20@2x.png (40x40 pixels)
echo - icon-20@3x.png (60x60 pixels)
echo - icon-29@2x.png (58x58 pixels)
echo - icon-29@3x.png (87x87 pixels)
echo - icon-40@2x.png (80x80 pixels)
echo - icon-40@3x.png (120x120 pixels)
echo - icon-60@2x.png (120x120 pixels)
echo - icon-60@3x.png (180x180 pixels)
echo - icon-76@2x.png (152x152 pixels)
echo - icon-83.5@2x.png (167x167 pixels)
echo - icon-1024.png (1024x1024 pixels)
echo.
echo You can use online tools like:
echo - https://appicon.co/
echo - https://makeappicon.com/
echo - https://icon.kitchen/
echo.
pause
