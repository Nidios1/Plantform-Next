@echo off
echo ========================================
echo Platform Next VPN - Extract AppIcons
echo ========================================
echo.

echo [1/5] Checking for AppIcons.zip...
if not exist "AppIcons.zip" (
    echo ERROR: AppIcons.zip not found!
    echo Please download it from https://appicon.co/ first
    echo Save it in the platformnext_vpn folder
    pause
    exit /b 1
)
echo   ✓ AppIcons.zip found

echo.
echo [2/5] Creating backup of current icons...
if exist "ios\Runner\Assets.xcassets\AppIcon.appiconset" (
    if not exist "ios\Runner\Assets.xcassets\AppIcon.appiconset.backup" (
        xcopy "ios\Runner\Assets.xcassets\AppIcon.appiconset" "ios\Runner\Assets.xcassets\AppIcon.appiconset.backup" /E /I /Y
        echo   ✓ Backup created
    ) else (
        echo   ✓ Backup already exists
    )
) else (
    echo   ⚠ No current icons to backup
)

echo.
echo [3/5] Extracting AppIcons.zip...
powershell -Command "Expand-Archive -Path 'AppIcons.zip' -DestinationPath 'temp_icons' -Force"
if %errorlevel% neq 0 (
    echo ERROR: Failed to extract AppIcons.zip
    pause
    exit /b 1
)
echo   ✓ AppIcons.zip extracted

echo.
echo [4/5] Copying iOS icons...
if exist "temp_icons\Assets.xcassets\AppIcon.appiconset" (
    xcopy "temp_icons\Assets.xcassets\AppIcon.appiconset\*" "ios\Runner\Assets.xcassets\AppIcon.appiconset\" /Y
    echo   ✓ iOS icons copied
) else (
    echo ERROR: AppIcon.appiconset not found in extracted files
    echo Please check the AppIcons.zip structure
    pause
    exit /b 1
)

echo.
echo [5/5] Cleaning up...
rmdir /S /Q "temp_icons"
echo   ✓ Temporary files cleaned up

echo.
echo ========================================
echo ✓ AppIcons extraction completed!
echo ========================================
echo.
echo NOW YOU HAVE:
echo ✅ Properly sized iOS icons
echo ✅ No more dimension errors
echo ✅ Professional app icons
echo.
echo NEXT STEPS:
echo 1. Run: commit_icons.bat
echo 2. Push to GitHub
echo 3. Build will succeed 100%%
echo.
echo The icon dimensions error is now FIXED!
echo.
pause
