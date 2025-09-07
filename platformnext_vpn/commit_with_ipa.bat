@echo off
echo ========================================
echo Platform Next VPN - Add IPA Build
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
git commit -m "Add IPA file creation to build workflow

- Added iOS device build (flutter build ios --no-codesign)
- Added IPA file creation using xcodebuild
- Updated upload artifacts to include IPA files
- Updated BUILD_GUIDE.md with IPA information

Now the build creates both simulator build and IPA file!"
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
echo ✓ IPA build added successfully!
echo ========================================
echo.
echo NOW THE BUILD CREATES:
echo ✅ iOS Simulator build
echo ✅ iOS Device build  
echo ✅ IPA file (.ipa)
echo ✅ All build artifacts uploaded
echo.
echo USAGE:
echo 1. Push code to GitHub
echo 2. Check Actions tab
echo 3. Download IPA file from artifacts
echo 4. Install on iOS device (if needed)
echo.
echo Check BUILD_GUIDE.md for details!
echo.
pause
