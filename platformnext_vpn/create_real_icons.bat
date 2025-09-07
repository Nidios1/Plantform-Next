@echo off
echo ========================================
echo Platform Next VPN - Real Icon Creator
echo ========================================
echo.

set "SOURCE_ICON=assets\images\icon.png"
set "ICON_DIR=ios\Runner\Assets.xcassets\AppIcon.appiconset"

echo [INFO] Creating real iOS app icons from %SOURCE_ICON%
echo.

echo [1/4] Checking source icon...
if not exist "%SOURCE_ICON%" (
    echo ERROR: Source icon not found at %SOURCE_ICON%
    echo Please make sure assets/images/icon.png exists
    pause
    exit /b 1
)
echo   ✓ Source icon found: %SOURCE_ICON%

echo.
echo [2/4] Checking ImageMagick...
where magick >nul 2>nul
if %errorlevel% neq 0 (
    echo WARNING: ImageMagick not found. Using placeholder files instead.
    echo To create real icons, install ImageMagick from: https://imagemagick.org/
    goto :create_placeholders
)

echo   ✓ ImageMagick found

echo.
echo [3/4] Creating real iOS app icons with ImageMagick...
echo.

REM iPhone icons
echo   Creating iPhone icons...
magick "%SOURCE_ICON%" -resize 40x40 "%ICON_DIR%\icon-20@2x.png"
magick "%SOURCE_ICON%" -resize 60x60 "%ICON_DIR%\icon-20@3x.png"
magick "%SOURCE_ICON%" -resize 58x58 "%ICON_DIR%\icon-29@2x.png"
magick "%SOURCE_ICON%" -resize 87x87 "%ICON_DIR%\icon-29@3x.png"
magick "%SOURCE_ICON%" -resize 80x80 "%ICON_DIR%\icon-40@2x.png"
magick "%SOURCE_ICON%" -resize 120x120 "%ICON_DIR%\icon-40@3x.png"
magick "%SOURCE_ICON%" -resize 120x120 "%ICON_DIR%\icon-60@2x.png"
magick "%SOURCE_ICON%" -resize 180x180 "%ICON_DIR%\icon-60@3x.png"

REM iPad icons
echo   Creating iPad icons...
magick "%SOURCE_ICON%" -resize 20x20 "%ICON_DIR%\icon-20.png"
magick "%SOURCE_ICON%" -resize 40x40 "%ICON_DIR%\icon-20@2x.png"
magick "%SOURCE_ICON%" -resize 29x29 "%ICON_DIR%\icon-29.png"
magick "%SOURCE_ICON%" -resize 58x58 "%ICON_DIR%\icon-29@2x.png"
magick "%SOURCE_ICON%" -resize 40x40 "%ICON_DIR%\icon-40.png"
magick "%SOURCE_ICON%" -resize 80x80 "%ICON_DIR%\icon-40@2x.png"
magick "%SOURCE_ICON%" -resize 152x152 "%ICON_DIR%\icon-76@2x.png"
magick "%SOURCE_ICON%" -resize 167x167 "%ICON_DIR%\icon-83.5@2x.png"

REM App Store icon
echo   Creating App Store icon...
magick "%SOURCE_ICON%" -resize 1024x1024 "%ICON_DIR%\icon-1024.png"

echo.
echo [4/4] Verifying created icons...
dir "%ICON_DIR%\*.png" | find /c ".png" > temp_count.txt
set /p icon_count=<temp_count.txt
del temp_count.txt

echo   ✓ Created %icon_count% icon files
echo.
echo ========================================
echo Real iOS app icons created successfully!
echo ========================================
echo.
echo All icons have been resized from the source image:
echo - Source: %SOURCE_ICON%
echo - Output: %ICON_DIR%\
echo.
echo Icon sizes created:
echo - iPhone: 20@2x, 20@3x, 29@2x, 29@3x, 40@2x, 40@3x, 60@2x, 60@3x
echo - iPad: 20, 20@2x, 29, 29@2x, 40, 40@2x, 76@2x, 83.5@2x
echo - App Store: 1024x1024
echo.
goto :end

:create_placeholders
echo.
echo [3/4] Creating placeholder icon files...
echo.

REM Create placeholder files
echo. > "%ICON_DIR%\icon-20@2x.png"
echo. > "%ICON_DIR%\icon-20@3x.png"
echo. > "%ICON_DIR%\icon-29@2x.png"
echo. > "%ICON_DIR%\icon-29@3x.png"
echo. > "%ICON_DIR%\icon-40@2x.png"
echo. > "%ICON_DIR%\icon-40@3x.png"
echo. > "%ICON_DIR%\icon-60@2x.png"
echo. > "%ICON_DIR%\icon-60@3x.png"
echo. > "%ICON_DIR%\icon-20.png"
echo. > "%ICON_DIR%\icon-29.png"
echo. > "%ICON_DIR%\icon-40.png"
echo. > "%ICON_DIR%\icon-76@2x.png"
echo. > "%ICON_DIR%\icon-83.5@2x.png"
echo. > "%ICON_DIR%\icon-1024.png"

echo.
echo [4/4] Placeholder icons created
echo.
echo ========================================
echo Placeholder icons created!
echo ========================================
echo.
echo WARNING: These are empty placeholder files.
echo For production, install ImageMagick and run this script again,
echo or manually replace with proper PNG images.
echo.

:end
echo Next steps:
echo 1. Run: .\rebuild_ios.bat
echo 2. Test the app on device/simulator
echo 3. Check if icon appears correctly
echo.
pause
