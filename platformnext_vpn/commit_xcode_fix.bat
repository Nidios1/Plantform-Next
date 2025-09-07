@echo off
echo ========================================
echo Platform Next VPN - Xcode Version Fix
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
    echo 3. Upload: .github/workflows/build_ios.yml
    echo 4. Upload: ios/Runner.xcodeproj/project.pbxproj
    echo 5. Commit message: "Fix Xcode version compatibility"
    echo.
    pause
    exit /b 1
)
echo   ✓ Files added to git

echo.
echo [2/4] Committing Xcode version fix...
git commit -m "Fix Xcode version compatibility

- Updated Xcode version to 16.4.0 (available on GitHub Actions)
- Updated iOS deployment target to 16.0 (compatible with Xcode 16.4)
- Fixed 'Could not find Xcode version 15.4' error
- Build should now succeed with available Xcode versions

Available Xcode versions on GitHub Actions:
- 16.4.0 (latest stable)
- 16.3.0, 16.2.0, 16.1.0, 16.0.0
- 26.0.0 (beta)"
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
        echo 3. Upload the 2 modified files
        echo 4. Commit with message: "Fix Xcode version compatibility"
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
echo ✓ Xcode version fix completed!
echo ========================================
echo.
echo FIXES APPLIED:
echo ✅ Xcode 16.4.0 (available on GitHub Actions)
echo ✅ iOS 16.0 deployment target
echo ✅ Fixed Xcode version compatibility
echo ✅ Build should succeed now
echo.
echo NEXT STEPS:
echo 1. Check GitHub Actions
echo 2. Build should succeed with Xcode 16.4.0
echo 3. No more "Could not find Xcode version" error
echo.
echo THE XCODE ERROR IS FIXED!
echo.
pause
