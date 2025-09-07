@echo off
echo ========================================
echo Platform Next VPN - iOS Rebuild Script
echo ========================================
echo.

echo [1/7] Cleaning previous builds...
cd /d "%~dp0"
flutter clean
if %errorlevel% neq 0 (
    echo ERROR: Flutter clean failed
    pause
    exit /b 1
)

echo.
echo [2/7] Creating app icons...
call create_real_icons.bat
if %errorlevel% neq 0 (
    echo WARNING: Icon creation failed, using placeholders
)

echo.
echo [3/7] Getting Flutter dependencies...
flutter pub get
if %errorlevel% neq 0 (
    echo ERROR: Flutter pub get failed
    pause
    exit /b 1
)

echo.
echo [4/7] Installing iOS CocoaPods dependencies...
cd ios
REM Clean pods and reinstall with updated deployment target
rmdir /s /q Pods 2>nul
del Podfile.lock 2>nul
pod install --repo-update
if %errorlevel% neq 0 (
    echo ERROR: Pod install failed
    pause
    exit /b 1
)
cd ..

echo.
echo [5/7] Generating iOS files...
flutter precache --ios
if %errorlevel% neq 0 (
    echo ERROR: Flutter precache failed
    pause
    exit /b 1
)

echo.
echo [6/7] Building iOS app (Debug)...
flutter build ios --debug --no-codesign
if %errorlevel% neq 0 (
    echo ERROR: iOS debug build failed
    pause
    exit /b 1
)

echo.
echo [7/7] Building iOS app (Release)...
flutter build ios --release --no-codesign
if %errorlevel% neq 0 (
    echo ERROR: iOS release build failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Debug build: build/ios/Debug-iphoneos/Runner.app
echo Release build: build/ios/Release-iphoneos/Runner.app
echo.
echo You can now test the app on a device or simulator.
echo.
pause
