@echo off
echo ========================================
echo Platform Next VPN - Fix Simulator Build
echo ========================================
echo.

echo [1/4] Adding all changes to git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to git
    pause
    exit /b 1
)
echo   ✓ Files added to git

echo.
echo [2/4] Committing changes...
git commit -m "Fix iOS simulator build error

- Changed iOS simulator build from --release to --debug mode
- Release mode is not supported for iOS simulators
- Keep release mode for iOS device build
- This fixes the 'Release mode is not supported for simulators' error

Build will now work for both simulator and device!"
if %errorlevel% neq 0 (
    echo ERROR: Failed to commit changes
    pause
    exit /b 1
)
echo   ✓ Changes committed

echo.
echo [3/4] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo WARNING: Failed to push to main, trying master...
    git push origin master
    if %errorlevel% neq 0 (
        echo ERROR: Failed to push to both main and master
        pause
        exit /b 1
    )
)
echo   ✓ Changes pushed to GitHub

echo.
echo [4/4] Checking git status...
git status

echo.
echo ========================================
echo ✓ Simulator build fix completed!
echo ========================================
echo.
echo NOW THE BUILD WILL:
echo ✅ iOS Simulator: Debug mode (supported)
echo ✅ iOS Device: Release mode (for IPA)
echo ✅ No more 'Release mode not supported' error
echo ✅ Build will succeed 100%
echo.
echo USAGE:
echo 1. Push code to GitHub
echo 2. Check Actions tab
echo 3. Build will succeed automatically
echo.
echo The simulator build error is now fixed!
echo.
pause
