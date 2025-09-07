@echo off
echo ========================================
echo Platform Next VPN - Fix Icon and Crash
echo ========================================
echo.

echo [1/5] Running PowerShell script to create real icons...
powershell -ExecutionPolicy Bypass -File "create_real_icons.ps1"
if %errorlevel% neq 0 (
    echo ERROR: Failed to create icons
    pause
    exit /b 1
)

echo.
echo [2/5] Cleaning Flutter project...
flutter clean
if %errorlevel% neq 0 (
    echo ERROR: Failed to clean project
    pause
    exit /b 1
)

echo.
echo [3/5] Getting Flutter dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo [4/5] Checking Flutter doctor...
flutter doctor
if %errorlevel% neq 0 (
    echo WARNING: Flutter doctor shows issues
)

echo.
echo [5/5] Building iOS project...
flutter build ios --release
if %errorlevel% neq 0 (
    echo ERROR: Failed to build iOS project
    echo Try running: flutter build ios --debug
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✓ Fix completed successfully!
echo ========================================
echo.
echo The app should now:
echo - Display proper icons
echo - Not crash on startup
echo - Show the VPN interface correctly
echo.
echo You can now:
echo 1. Open the project in Xcode
echo 2. Run on device or simulator
echo 3. Archive for App Store
echo.
pause
