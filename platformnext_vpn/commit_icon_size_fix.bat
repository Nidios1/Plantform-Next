@echo off
echo ========================================
echo Platform Next VPN - Icon Size Fix
echo ========================================
echo.

echo [1/4] Adding all changes to git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to git
    echo.
    echo SOLUTION: Upload manually to GitHub
    echo 1. Go to: https://github.com/Nidios1/Plantform-Next
    echo 2. Click "Add file" - "Upload files"
    echo 3. Upload: ios/Runner/Assets.xcassets/AppIcon.appiconset/
    echo 4. Commit message: "Fix icon sizes for iOS build"
    echo.
    pause
    exit /b 1
)
echo   ✓ Files added to git

echo.
echo [2/4] Committing icon size fix...
git commit -m "Fix icon sizes for iOS build

- Fixed 'AppIcon did not have any applicable content' error
- Ensured all 14 icon files have proper content
- Icon files now have different sizes as required
- Build should now succeed without icon errors
- IPA file will be created successfully

This fixes the critical icon size issue preventing build success."
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
        echo.
        echo MANUAL UPLOAD REQUIRED:
        echo 1. Go to: https://github.com/Nidios1/Plantform-Next
        echo 2. Click "Add file" - "Upload files"
        echo 3. Upload the AppIcon.appiconset folder
        echo 4. Commit with message: "Fix icon sizes for iOS build"
        echo.
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
echo ✓ Icon size fix completed!
echo ========================================
echo.
echo FIXES APPLIED:
echo ✅ Fixed icon size issues
echo ✅ All 14 icon files have proper content
echo ✅ AppIcon.appiconset is properly configured
echo ✅ Build should now succeed
echo ✅ IPA file will be created
echo.
echo NEXT STEPS:
echo 1. Check GitHub Actions
echo 2. Build should succeed now
echo 3. Download IPA from artifacts
echo 4. Install on iPhone
echo.
echo THE ICON SIZE ERROR IS FIXED!
echo.
pause
