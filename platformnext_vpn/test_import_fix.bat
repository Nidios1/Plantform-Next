@echo off
echo ========================================
echo Platform Next VPN - Import Fix Test
echo ========================================
echo.

echo [INFO] Testing build after fixing runZonedGuarded import
echo.

echo [1/5] Checking main.dart imports...
cd /d "%~dp0"
findstr /n "import.*dart:async" lib\main.dart
if %errorlevel% neq 0 (
    echo ERROR: dart:async import not found
    pause
    exit /b 1
)
echo   ✓ dart:async import found

echo.
echo [2/5] Checking runZonedGuarded usage...
findstr /n "runZonedGuarded" lib\main.dart
if %errorlevel% neq 0 (
    echo ERROR: runZonedGuarded not found
    pause
    exit /b 1
)
echo   ✓ runZonedGuarded usage found

echo.
echo [3/5] Cleaning previous builds...
flutter clean
if %errorlevel% neq 0 (
    echo ERROR: Flutter clean failed
    pause
    exit /b 1
)

echo.
echo [4/5] Getting dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Flutter pub get failed
    pause
    exit /b 1
)

echo.
echo [5/5] Testing iOS build for simulator...
flutter build ios --simulator --debug
if %errorlevel% neq 0 (
    echo ERROR: iOS build failed
    echo Import fix did not resolve the issue
    pause
    exit /b 1
)

echo.
echo ========================================
echo Import Fix Test Completed Successfully!
echo ========================================
echo.
echo ✅ dart:async import: Found
echo ✅ runZonedGuarded usage: Found
echo ✅ Flutter clean: Success
echo ✅ Dependencies: Updated
echo ✅ iOS build: Success
echo.
echo The runZonedGuarded import issue has been resolved!
echo.
echo Next steps:
echo 1. Test on iOS simulator
echo 2. Test on iOS device
echo 3. Push to GitHub for automated build
echo.
pause
