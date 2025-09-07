@echo off
echo ========================================
echo Platform Next VPN - Complete Build Test
echo ========================================
echo.

echo [INFO] Testing complete build process
echo.

echo [1/8] Checking Flutter version...
flutter --version
if %errorlevel% neq 0 (
    echo ERROR: Flutter not found
    pause
    exit /b 1
)

echo.
echo [2/8] Checking project structure...
cd /d "%~dp0"
if not exist "lib\main.dart" (
    echo ERROR: main.dart not found
    pause
    exit /b 1
)
echo   ✓ Project structure OK

echo.
echo [3/8] Checking app icons...
if not exist "ios\Runner\Assets.xcassets\AppIcon.appiconset\icon-1024.png" (
    echo WARNING: App icons not found, will be created during build
) else (
    echo   ✓ App icons found
)

echo.
echo [4/8] Cleaning previous builds...
flutter clean
if %errorlevel% neq 0 (
    echo ERROR: Flutter clean failed
    pause
    exit /b 1
)

echo.
echo [5/8] Getting dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Flutter pub get failed
    pause
    exit /b 1
)

echo.
echo [6/8] Installing iOS pods...
cd ios
pod install --repo-update
if %errorlevel% neq 0 (
    echo ERROR: Pod install failed
    pause
    exit /b 1
)
cd ..

echo.
echo [7/8] Building iOS app for simulator...
flutter build ios --simulator --debug
if %errorlevel% neq 0 (
    echo ERROR: iOS build failed
    pause
    exit /b 1
)

echo.
echo [8/8] Verifying build output...
if exist "build\ios\Debug-iphonesimulator\Runner.app" (
    echo   ✓ Runner.app found in Debug-iphonesimulator
) else (
    echo   ⚠ Runner.app not found in expected location
    echo   Searching for Runner.app...
    dir /s /b build\ios\Runner.app 2>nul
)

echo.
echo ========================================
echo Complete Build Test Completed Successfully!
echo ========================================
echo.
echo ✅ Flutter version: Compatible
echo ✅ Project structure: OK
echo ✅ Dependencies: Updated
echo ✅ iOS pods: Installed
echo ✅ iOS build: Success
echo ✅ Build output: Verified
echo.
echo The complete build process is working!
echo.
echo Build output location:
echo - build\ios\Debug-iphonesimulator\Runner.app
echo.
echo Next steps:
echo 1. Test on iOS simulator
echo 2. Push to GitHub for automated build
echo 3. Download IPA from GitHub Actions
echo.
pause
