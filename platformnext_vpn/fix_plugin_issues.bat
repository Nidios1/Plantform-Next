@echo off
echo ========================================
echo Platform Next VPN - Plugin Issues Fix
echo ========================================
echo.

echo [INFO] Fixing plugin compatibility issues
echo.

echo [1/6] Cleaning Flutter cache...
cd /d "%~dp0"
flutter clean
if %errorlevel% neq 0 (
    echo ERROR: Flutter clean failed
    pause
    exit /b 1
)

echo.
echo [2/6] Removing old dependencies...
if exist ".dart_tool" rmdir /s /q ".dart_tool"
if exist "build" rmdir /s /q "build"
if exist "ios\Pods" rmdir /s /q "ios\Pods"
if exist "ios\Podfile.lock" del "ios\Podfile.lock"

echo.
echo [3/6] Getting updated dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Flutter pub get failed
    pause
    exit /b 1
)

echo.
echo [4/6] Installing iOS pods with updated plugins...
cd ios
pod install --repo-update
if %errorlevel% neq 0 (
    echo ERROR: Pod install failed
    echo This might be due to plugin compatibility issues
    pause
    exit /b 1
)
cd ..

echo.
echo [5/6] Testing iOS build for simulator...
flutter build ios --simulator --debug
if %errorlevel% neq 0 (
    echo ERROR: iOS build failed
    echo Plugin compatibility issues still exist
    pause
    exit /b 1
)

echo.
echo [6/6] Testing iOS build for release...
flutter build ios --simulator --release
if %errorlevel% neq 0 (
    echo ERROR: iOS release build failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo Plugin Issues Fixed Successfully!
echo ========================================
echo.
echo ✅ Flutter cache: Cleaned
echo ✅ Dependencies: Updated
echo ✅ iOS pods: Installed
echo ✅ Debug build: Success
echo ✅ Release build: Success
echo.
echo Plugin compatibility issues have been resolved!
echo.
echo Updated plugin versions:
echo - file_picker: ^8.0.0+1 (fixed Windows/Linux issues)
echo - device_info_plus: ^10.1.0
echo - package_info_plus: ^8.0.0
echo - connectivity_plus: ^6.0.3
echo - permission_handler: ^11.3.1
echo - url_launcher: ^6.2.5
echo.
echo Next steps:
echo 1. Test on iOS simulator
echo 2. Test on iOS device
echo 3. Push to GitHub for automated build
echo.
pause
